import 'package:cal_ai/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          child: BackButton(),
        ),
        24.horizontalSpace,
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 4,
                color: Colors.grey,
              ),
              AnimatedContainer(
                duration: Constants.shortAnimationDuration,
                height: 4,
                color: Colors.black,
              ),
            ],
          ),
        )
      ],
    );
  }
}
