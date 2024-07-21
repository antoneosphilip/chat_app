import 'package:christy/features/add_friend/data/api_Service/search_friend_api_service.dart';
import 'package:christy/features/add_friend/data/repo/search_friend_repo.dart';
import 'package:christy/features/add_friend/logic/cubit/search_friend_cubit.dart';
import 'package:christy/features/home/data/api_service/get_friends_api_service.dart';
import 'package:christy/features/home/data/repo/all_friends_repo.dart';
import 'package:christy/features/login/data/apis/login_api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/api_service/singlar_service.dart';
import '../../features/home/logic/cubit/friend_list_cubit.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../helpers/constans.dart';
import '../helpers/shared_pref_helper.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<LoginApiService>(() => LoginApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));


  //friend list
  getIt.registerLazySingleton<GetFriendsApiService>(() => GetFriendsApiService(dio));
  // getIt.registerLazySingleton<SignalRService>(() => SignalRService());

  getIt.registerLazySingleton<FriendListRepo>(() => FriendListRepo(getIt()));
  getIt.registerLazySingleton<FriendListCubit>(() => FriendListCubit(getIt()));

  //search friend
  getIt.registerLazySingleton<SearchFriendApiService>(() => SearchFriendApiService(dio));

  getIt.registerLazySingleton<SearchFriendRepo>(() => SearchFriendRepo(getIt()));
  getIt.registerLazySingleton<SearchFriendCubit>(() => SearchFriendCubit(getIt()));


}
