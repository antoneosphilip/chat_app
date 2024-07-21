import 'package:christy/core/theming/colors.dart';
import 'package:christy/features/home/ui/home_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../add_friend/ui/search_friend.dart';

class HomeBottomNav extends StatelessWidget {

   HomeBottomNav({super.key});
  Color?color=ColorsManager.mainBurble;
  @override
  Widget build(BuildContext context) => PersistentTabView(
    margin: const EdgeInsets.only(bottom: 10),
    tabs: tabs(),
    navBarBuilder: (navBarConfig) => Style1BottomNavBar(
      navBarConfig: navBarConfig,
    ),
  );
   List<PersistentTabConfig> tabs() => [
     PersistentTabConfig(
       screen: const HomeScreen(),
       item: ItemConfig(
         icon: const ImageIcon(AssetImage('assets/png/Home.png')),
         activeForegroundColor: color!
       ),
     ),
     PersistentTabConfig(
       screen: const AddFriendScreen(),
       item: ItemConfig(
         icon:const ImageIcon(AssetImage('assets/png/Add-User.png'),),
         activeForegroundColor: color!
       ),
     ),
     PersistentTabConfig(
       screen: const AddFriendScreen(),
       item: ItemConfig(
         icon: const ImageIcon(AssetImage('assets/png/Setting.png')),
           activeForegroundColor: color!
       ),
     ),
   ];

}
