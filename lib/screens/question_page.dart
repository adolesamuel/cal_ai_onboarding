import 'package:cal_ai/models/question_model.dart';
import 'package:cal_ai/screens/state/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionPage extends ConsumerWidget {
  final Question question;
  final void Function(String)? onOptionSelected;
  const QuestionPage({
    super.key,
    required this.question,
    this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context, ref) {
    final onboardingCTRL = ref.read(onboardingControllerProvider);
    return ListenableBuilder(
        listenable: onboardingCTRL,
        builder: (context, _) {
          return Scaffold(
            body: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    question.question,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
                32.verticalSpace,
                const Text(
                  'This will be used to calibrate your custom plan.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                32.verticalSpace,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [],
                  ),
                ),
                24.verticalSpace,
                ElevatedButton(
                  onPressed: () {
                    // onOptionSelected?.call();
                    onboardingCTRL.nextPage();
                  },
                  child: const Text('Next'),
                )
              ],
            ),
          );
        });
  }
}
