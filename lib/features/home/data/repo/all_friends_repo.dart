import 'package:christy/core/networking/api_error_handler.dart';
import 'package:christy/features/home/data/api_service/get_friends_api_service.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/check_server_connect.dart';
import '../api_service/singlar_service.dart';
import '../model/friend_chat_model.dart';

class FriendListRepo {
  final GetFriendsApiService apiService;

  FriendListRepo(this.apiService);

  Future<ApiResult<FriendChatModel>> getFriendsChatList() async {
    try {
      if (await CheckServerConnection.checkServerConnection()) {
        final response = await apiService.getFriendsChatList();
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(ErrorHandler.handle("please try again"));
      }
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Stream<Map<String, dynamic>> get friendChatStream =>
      SignalRService.friendChatStream;
}
