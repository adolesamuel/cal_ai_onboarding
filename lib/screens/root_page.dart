import 'package:cal_ai/screens/question_page.dart';
import 'package:cal_ai/screens/sigin_up_screen.dart';
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
    List<Widget> pages = [
      ...List.generate(
        onboadingController.questions.length,
        (index) => QuestionPage(
          key: UniqueKey(),
          question: onboadingController.questions[index],
          onOptionSelected: (value, inputMap) {
            onboadingController.updateOnboardingData(
              onboadingController.questions[index].copyWith(
                value,
                inputMap,
              ),
            );
          },
        ),
      ),
      const SignUpScreen(),
    ];

    return ListenableBuilder(
        listenable: onboadingController,
        builder: (context, _) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  kToolbarHeight.verticalSpace,
                  const PageIndicator(),
                  8.verticalSpace,
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeIn,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: pages[onboadingController.currentpage],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
