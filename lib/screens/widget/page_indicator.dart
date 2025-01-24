import 'package:cal_ai/configs/constants.dart';
import 'package:cal_ai/screens/state/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends ConsumerWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contrl = ref.read(onboardingControllerProvider);
    return ListenableBuilder(
        listenable: contrl,
        builder: (context, _) {
          final numOfPages = contrl.questions.length;
          return Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: BackButton(
                  onPressed: contrl.previousPage,
                ),
              ),
              24.horizontalSpace,
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 4,
                      color: Colors.grey,
                    ),
                    LayoutBuilder(builder: (context, constraints) {
                      return AnimatedContainer(
                        duration: Constants.shortAnimationDuration,
                        height: 4,
                        width: constraints.maxWidth * (contrl.currentpage / numOfPages),
                        color: Colors.black,
                      );
                    }),
                  ],
                ),
              )
            ],
          );
        });
  }
}
