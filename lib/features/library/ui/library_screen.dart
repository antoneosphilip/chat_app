import 'package:christy/core/theming/text_manager.dart';
import 'package:christy/features/library/ui/widgets/gird_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
              ),
              Text(
                TextManager.giftAchievement,
                style: TextStyles.font28lackW400,
              ),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ),
        const GirdViewWidget(),
      ],
    )));
  }
}
