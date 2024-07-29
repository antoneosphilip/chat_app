import 'package:christy/features/search_friend/ui/widget/request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestsFriend extends StatelessWidget {
  const RequestsFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          const RequestItem(),
        ],
      )),
    );
  }
}
