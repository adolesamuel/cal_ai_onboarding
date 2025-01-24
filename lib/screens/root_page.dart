import 'package:cal_ai/screens/question_page.dart';
import 'package:cal_ai/screens/sigin_in_screen.dart';
import 'package:cal_ai/screens/state/onboarding_controller.dart';
import 'package:cal_ai/screens/widget/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// What are your primary health goals? (e.g., weight loss, muscle gain, maintaining a balanced diet)
// Do you have any dietary preferences or restrictions? (e.g., vegetarian, vegan, gluten-free, allergies)
// What is your current activity level? (e.g., sedentary, lightly active, very active)
// How often do you typically cook at home? (e.g., rarely, sometimes, always)
// What is your age and current weight

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
                onPageChanged: onboadingController.updatePage,
                children: [
                  ...List.generate(
                    onboadingController.questions.length,
                    (index) => QuestionPage(
                      question: onboadingController.questions[index],
                      onOptionSelected: (value) {},
                    ),
                  ),
                  const SiginInScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
