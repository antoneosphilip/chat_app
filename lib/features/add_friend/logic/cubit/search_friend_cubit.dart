import 'dart:async';

import 'package:christy/features/add_friend/data/models/search_friend_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/search_friend_repo.dart';
import 'search_friend_states.dart';

class SearchFriendCubit extends Cubit<SearchFriendStates> {
  final SearchFriendRepo _searchFriendRepo;

  SearchFriendCubit(this._searchFriendRepo)
      : super(SearchFriendInitialStates());
  TextEditingController searchController = TextEditingController();
  List<SearchFriendModel>? searchFriendModel;
  Timer? _timer;

  static SearchFriendCubit get(context) =>
      BlocProvider.of<SearchFriendCubit>(context);

  Future<void> getFriendSearchList() async {
    emit(SearchFriendLoadingStates());
    final data =
        await _searchFriendRepo.addFriend(searchKey: searchController.text);
    data.when(success: ((success) {
      searchFriendModel = success;
      emit(SearchFriendSuccessStates(data: data));
    }), failure: ((error) {
      emit(SearchFriendErrorStates(error: error.apiErrorModel.title ?? ''));
    }));
  }

  void listenTextEditingController() {
    searchController.addListener(
      () {
        if (_timer?.isActive ?? false) {
          _timer?.cancel();
        }
        _timer = Timer(
          const Duration(milliseconds: 500),
          () {
            if (searchController.text.isNotEmpty) {
              getFriendSearchList();
            } else {
              searchFriendModel!.clear();
              emit(SearchFriendSuccessStates(data: ''));
            }
          },
        );
      },
    );
  }
}
