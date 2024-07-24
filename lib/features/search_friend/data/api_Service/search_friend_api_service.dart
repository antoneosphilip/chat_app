import 'package:christy/core/networking/api_networking.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/search_friend_model.dart';

part 'search_friend_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SearchFriendApiService {
  factory SearchFriendApiService(Dio dio, {String? baseUrl}) =
      _SearchFriendApiService;

  @GET(ApiConstants.addFriend)
  Future<List<SearchFriendModel>> addFriend(@Query('search') String searchKey);
}
