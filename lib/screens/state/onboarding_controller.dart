import 'dart:math';

import 'package:cal_ai/models/onboarding_data.dart';
import 'package:cal_ai/models/question_model.dart';
import 'package:cal_ai/models/sign_up_model.dart';
import 'package:cal_ai/screens/state/signup_state_notifier.dart';
import 'package:cal_ai/screens/state/state.dart';
import 'package:cal_ai/screens/widget/app_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingControllerProvider = Provider((ref) => OnboardingController());

class OnboardingController extends ChangeNotifier {
  OnboardingController();

  int currentpage = 0;

  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  List<Question> questions = [
    Question(
      questions: Questions.healthgoals,
      question: 'What are your primary health goals?',
      options: ['weight loss', 'muscle gain', 'maintaining a balanced diet'],
    ),
    Question(
      questions: Questions.dietaryPreference,
      question: 'Do you have any dietary preferences or restrictions?',
      options: ['vegetarian', 'vegan', 'gluten - free', 'allergies'],
    ),
    Question(
      questions: Questions.activitylevel,
      question: 'What is your current activity level?',
      options: ['sedentary', 'lightly active', 'very active'],
    ),
    Question(
      questions: Questions.cookingFrequency,
      question: 'How often do you typically cook at home?',
      options: ['rarely', 'sometimes', 'always'],
    ),
    Question(
      questions: Questions.ageAndWeight,
      question: 'What is your age and current weight',
      type: QuestionType.input,
      options: ['age (yrs)', 'weight (kg)'],
    ),
  ];

  OnboardingData onboardingData = OnboardingData();

  void nextPage() {
    currentpage += 1;
    currentpage = min(currentpage, questions.length + 1);
    notifyListeners();
  }

  void previousPage() {
    currentpage -= 1;
    currentpage = max(currentpage, 0);
    notifyListeners();
  }

  void updateOnboardingData(Question newData) {
    switch (newData.questions) {
      case Questions.healthgoals:
        onboardingData = onboardingData.copyWith(healthgoals: newData.selection);
        break;
      case Questions.dietaryPreference:
        onboardingData = onboardingData.copyWith(dietaryPreference: newData.selection);
        break;
      case Questions.activitylevel:
        onboardingData = onboardingData.copyWith(activitylevel: newData.selection);
        break;
      case Questions.cookingFrequency:
        onboardingData = onboardingData.copyWith(cookingFrequency: newData.selection);
        break;
      case Questions.ageAndWeight:
        onboardingData = onboardingData.copyWith(
          ageYrs: newData.inputMap?['age (yrs)'],
          weightKG: newData.inputMap?['weight (kg)'],
        );
        break;
    }
  }

  SignUpState signUpState(WidgetRef ref) => ref.watch(signUpStateProvider);

  void listenToSignInState(BuildContext context, WidgetRef ref) {
    ref.listen(signUpStateProvider, (prev, next) {
      if (next is SignUpFailure) {
        AppSnackbar(
          context,
          text: next.failure.message,
          isError: true,
        ).show();
      } else if (next is SignUpSuccess) {
        AppSnackbar(
          context,
          text: 'Signed Up',
        ).show();
      }
    });
  }

  void signUp(WidgetRef ref) {
    //Validate Email and Password Exists using formkey
    //make sign up request.
    ref.read(signUpStateProvider.notifier).signUp(
          signUpInfo: SignUpModel(email: emailController.text, password: passwordController.text),
          data: onboardingData.copyWith(email: emailController.text),
        );
  }

//Just A shortcut.
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
