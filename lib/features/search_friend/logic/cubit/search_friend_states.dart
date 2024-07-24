abstract class SearchFriendStates {}

class SearchFriendInitialStates extends SearchFriendStates {}

class SearchFriendLoadingStates extends SearchFriendStates {}

class SearchFriendSuccessStates<T> extends SearchFriendStates {
  final T data;

  SearchFriendSuccessStates({required this.data});
}

class SearchFriendErrorStates extends SearchFriendStates {
  final String error;

  SearchFriendErrorStates({required this.error});
}
