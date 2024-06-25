import 'package:christy/core/theming/colors.dart';
import 'package:christy/features/library/data/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'food_item.dart';

class GirdViewWidget extends StatelessWidget {
  const GirdViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<FoodModel> listFoodModel = [
      FoodModel(
          'assets/svgs/burger.svg', "Free Burger", ColorsManager.yellow, 3),
      FoodModel('assets/svgs/icecream.svg', "Free Ice Cream",
          ColorsManager.burple, 2),
      FoodModel(
          'assets/svgs/burger.svg', "Free Burger", ColorsManager.yellow, 3),
      FoodModel('assets/svgs/icecream.svg', "Free Ice Cream",
          ColorsManager.burple, 2),
      FoodModel(
          'assets/svgs/burger.svg', "Free Burger", ColorsManager.yellow, 3),
      FoodModel(
          'assets/svgs/icecream.svg', "Free Ice Cream", ColorsManager.burple, 2,
          isNotification: false),
    ];
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 5.0.w,
          mainAxisSpacing: 5.0.h,
        ),
        itemCount: listFoodModel.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: FoodItem(
              image: listFoodModel[index].image,
              foodName: listFoodModel[index].foodName,
              color: listFoodModel[index].color,
              notificationCount: listFoodModel[index].notificationCount,
              isNotification: listFoodModel[index].isNotification,
            ),
          );
        },
      ),
    );
  }
}
