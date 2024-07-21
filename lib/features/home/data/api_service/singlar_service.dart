import 'dart:async';

import 'package:signalr_netcore/signalr_client.dart';

import '../../../../core/helpers/constans.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/api_networking.dart';

class SignalRService {
  static HubConnection? _connection;
  static final StreamController<Map<String, dynamic>> _friendChatController =
      StreamController<Map<String, dynamic>>.broadcast();

  static bool isConnected = false;
  static int _retryCount = 0;
  static const int maxRetries = 10;

  static Future<void> initializeConnection() async {
    _connection = HubConnectionBuilder()
        .withUrl(ApiConstants.singularServerUrl,
            options: HttpConnectionOptions(
              accessTokenFactory: () async =>
                  await SharedPrefHelper.getString(SharedPrefKey.token),
            ))
        .withAutomaticReconnect()
        .build();

    _connection?.onclose(
      ({error}) {
        print('Connection closed: $error');
        // Optionally, you can implement a retry mechanism here
        _handleConnectionClose();
      },
    );

    _connection?.on('RecieveMessage', (data) {
      print('Received data: $data');
      handleReceivedData(data);
    });

    await startConnection();
  }

  static Future<void> startConnection() async {
    try {
      if (_connection?.state == HubConnectionState.Disconnected) {
        await _connection?.start()?.timeout(
              const Duration(seconds: 20),
              onTimeout: () => throw 'Connection timeout',
            );
        print('Connection started');
        isConnected = true;
        _retryCount = 0; // Reset retry count on successful connection
      }
    } catch (error) {
      if (_retryCount >= maxRetries) {
        throw 'Cannot connect after $_retryCount retries';
      }
      print('Connection failed: $error');
      await Future.delayed(const Duration(seconds: 1));
      _retryCount++;
      await startConnection(); // Retry connection
    }
  }

  static void _handleConnectionClose() {
    if (isConnected) {
      print('Reconnecting...');
      isConnected = false;
      startConnection();
    }
  }

  static void handleReceivedData(dynamic data) {
    try {
      print("Handling received data");

      if (data != null) {
        if (data is List) {
          // Handle if data is a List
          for (var item in data) {
            processItem(item);
          }
        } else {
          // Handle single item
          processItem(data);
        }
      } else {
        print('Received null data');
      }
    } catch (error) {
      print('Error processing received data: $error');
    }
  }

  static void processItem(dynamic item) {
    try {
      if (item is Map<String, dynamic>) {
        _friendChatController.add(item);
        print("Item added to stream");
      } else {
        print('Unexpected item format: $item');
      }
    } catch (error) {
      print('Error processing item: $error');
    }
  }

  static Stream<Map<String, dynamic>> get friendChatStream =>
      _friendChatController.stream;

  static Future<void> sendData(Object data) async {
    try {
      if (_connection?.state == HubConnectionState.Connected) {
        await _connection?.send('SendData', args: [data]);
        print('Data sent');
      } else {
        print('Cannot send data. Connection is not established.');
      }
    } catch (error) {
      print('Failed to invoke SendData: $error');
    }
  }

  static void dispose() {
    _friendChatController.close();
    _connection?.stop();
  }
}
