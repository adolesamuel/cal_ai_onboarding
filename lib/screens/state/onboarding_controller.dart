import 'package:cal_ai/configs/constants.dart';
import 'package:cal_ai/models/onboarding_data.dart';
import 'package:cal_ai/models/sign_up_model.dart';
import 'package:cal_ai/screens/state/signup_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingControllerProvider = Provider((ref) => OnboardingController(ref));

class OnboardingController extends ChangeNotifier {
  late final Ref ref;
  OnboardingController(this.ref);
  late final PageController pageController = PageController();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  void nextPage() {
    pageController.nextPage(
      duration: Constants.shortAnimationDuration,
      curve: Curves.easeIn,
    );
  }

  void signUp() {
    //Validate Email and Password Exists using formkey
    //make sign up request.
    ref.read(signUpStateProvider.notifier).signUp(
        signUpInfo: SignUpModel(email: emailController.text, password: passwordController.text),
        data: OnboardingData(email: emailController.text));
  }

  @override
  void dispose() {
    pageController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
