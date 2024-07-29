import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class RequestItem extends StatelessWidget {
  const RequestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 17.w,
        ),
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            image: DecorationImage(image: CachedNetworkImageProvider('https://th.bing.com/th/id/R.1a169ee0e11d6f85260b7864aa916f2c?rik=F6uhG3K5RxD0Bg&pid=ImgRaw&r=0',)),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 13.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'antones',
              style: TextStyles.font18BlackSemiBold,
            ),
            Text('antoneos@gamil',style: TextStyles.font13GreyRegular,),
          ],
        ),
        const Spacer(),
        const Icon(Icons.check,size: 30,color: Colors.green,),
        SizedBox(width: 20.w,),
        const Icon(Icons.close,size: 30,color: Colors.red,),
        SizedBox(width: 20.w,)
      ],
    );
  }
}
