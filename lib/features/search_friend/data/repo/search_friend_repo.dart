import 'package:christy/core/networking/api_error_handler.dart';
import 'package:christy/core/networking/api_result.dart';
import 'package:christy/features/add_friend/data/api_Service/search_friend_api_service.dart';

import '../models/search_friend_model.dart';

class SearchFriendRepo {
  SearchFriendApiService searchFriendApiService;

  SearchFriendRepo(this.searchFriendApiService);

  Future<ApiResult<List<SearchFriendModel>>> addFriend(
      {required String searchKey}) async {
    try {
      final response = await searchFriendApiService.addFriend(searchKey);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
