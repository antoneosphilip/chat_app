import 'package:christy/core/helpers/constans.dart';
import 'package:christy/core/helpers/extensions.dart';
import 'package:christy/features/home/ui/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/shared_pref_helper.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/colors.dart';
import 'features/login/ui/login_screen.dart';

// class ChristyApp extends StatelessWidget {
//   final AppRouter appRouter;
//
//   const ChristyApp({
//     super.key,
//     required this.appRouter,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//         designSize: const Size(375, 812),
//         minTextAdapt: true,
//         child: MaterialApp(
//           title: 'Chat App',
//           theme: ThemeData(
//             primaryColor: ColorsManager.white,
//             scaffoldBackgroundColor: ColorsManager.white,
//           ),
//           debugShowCheckedModeBanner: false,
//           builder: EasyLoading.init(),
//           onGenerateRoute: appRouter.generateRoute,
//           initialRoute: isLogin?Routes.homeBottomNav: Routes.loginScreen,
//           // home:isLogin?HomeScreen(): LoginScreen()
//
//         ));
//   }
// }
