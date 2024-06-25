import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class FoodItem extends StatelessWidget {
  final String image;
  final String foodName;
  final Color color;
  final int notificationCount;
  final bool isNotification;

  const FoodItem(
      {super.key,
      required this.image,
      required this.foodName,
      required this.color,
      required this.notificationCount,
      this.isNotification = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.r),
                        color: color),
                    child: Padding(
                      padding: EdgeInsets.all(25.0.sp),
                      child: SvgPicture.asset(
                        image,
                        height: 20.h,
                        width: 20.w,
                      ),
                    )),
                isNotification
                    ? Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.r),
                          color: ColorsManager.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 35.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.r),
                              color: Colors.red,
                            ),
                            child: Center(
                                child: Text(
                              notificationCount.toString(),
                              style: TextStyles.font20WhiteW400,
                            )),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              foodName,
              style: TextStyles.font18BlackW500,
            )
          ],
        )
      ],
    );
  }
}
