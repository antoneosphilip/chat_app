import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';


import '../../data/model/friend_chat_model.dart';
import '../../data/repo/all_friends_repo.dart';
import 'friend_list_states.dart';

class FriendListCubit extends Cubit<FriendListState> {
  final FriendListRepo _friendListRepo;
  late StreamSubscription<Map<String, dynamic>> _friendChatSubscription;
  FriendChatModel? friendChatModel;

  FriendListCubit(this._friendListRepo) : super(Initial()) {
    fetchInitialData();
  }

  static FriendListCubit get(context) =>
      BlocProvider.of<FriendListCubit>(context);

  void fetchInitialData() async {
    emit(Loading());

    final data = await _friendListRepo.getFriendsChatList();
    data.when(
      success: (data) async {
        friendChatModel = data;
        listenToData();
        emit(Success(data));
      },
      failure: (error) {
        emit(Error(error.apiErrorModel.title ?? ''));
      },
    );
  }

  Future<void> listenToData() async {
    _friendChatSubscription = _friendListRepo.friendChatStream.listen(
      (friendChat) {
        try {
          final latestMessage = LatestMessage.fromJson(friendChat);
          final friends = friendChatModel?.friends ?? [];

          // Find the friend and update their latest message
          final friend = friends.firstWhere(
            (e) => e.userId == latestMessage.senderId,
          );
          friend.latestMessage =
              latestMessage; // Update or add the latest message
          emit(Success(friendChatModel));
        } catch (error) {
          emit(Error(error.toString()));
        }
      },
      onError: (error) {
        emit(Error(error.toString()));
      },
    );
  }
}
