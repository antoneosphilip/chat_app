import 'dart:ui';

class FoodModel {
  String image;
  String foodName;
  Color color;
  int notificationCount;
  bool isNotification;

  FoodModel(this.image, this.foodName, this.color, this.notificationCount,
      {this.isNotification = true});
}
