import 'package:cal_ai/screens/question_page.dart';
import 'package:cal_ai/screens/sigin_in_screen.dart';
import 'package:cal_ai/screens/state/onboarding_controller.dart';
import 'package:cal_ai/screens/widget/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final onboadingController = ref.read(onboardingControllerProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            kToolbarHeight.verticalSpace,
            const PageIndicator(),
            8.verticalSpace,
            Expanded(
              child: PageView(
                controller: onboadingController.pageController,
                children: const [
                  SiginInScreen(),
                  QuestionPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
