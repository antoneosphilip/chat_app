import 'package:christy/core/di/dependency_injection.dart';
import 'package:christy/core/helpers/extensions.dart';
import 'package:christy/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/helpers/constans.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/routing/routes.dart';
import 'core/theming/colors.dart';
import 'core/widgets/easy_loading.dart';
import 'main_chat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  await SharedPrefHelper.init();
  await checkIfLoggedInUser();
  // SignalRService signalRService=SignalRService('https://syncord.koyeb.app','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhbnRvbmVvc3BoaWxpcDNAZ21haWwuY29tIiwiSWQiOiIwYThiZmQ5ZS1jOTVhLTRiYWYtYTFkOS1kODFkMjExMzlhYWQiLCJleHAiOjE3MjEzMjM2OTgsImlzcyI6IlN5bmNvcmQuY29tIiwiYXVkIjoiU3luY29yZC5jb20ifQ.EGjDWShQYvBOAF51Lo6vzOtUj-EPjVsmg9zySShQETc');
  // signalRService.initialize();
  EasyLoadingWidget().configLoading();
  setupGetIt();
  runApp(ChristyApp(
    appRouter: AppRouter(),
  ));
}

class ChristyApp extends StatelessWidget {
  final AppRouter appRouter;

  const ChristyApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Chat App',
          theme: ThemeData(
            primaryColor: ColorsManager.white,
            scaffoldBackgroundColor: ColorsManager.white,
          ),
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: isLogin?Routes.homeBottomNav: Routes.loginScreen,
          // home:isLogin?HomeScreen(): LoginScreen()

        ));
  }
}


checkIfLoggedInUser() async {
  String? userToken =
   SharedPrefHelper.getString(SharedPrefKey.token);
  if (!userToken.isNullOrEmpty()) {
    isLogin = true;
  } else {
    isLogin = false;
  }
}
