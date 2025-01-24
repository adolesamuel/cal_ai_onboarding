import 'package:cal_ai/configs/constants.dart';
import 'package:cal_ai/models/onboarding_data.dart';
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

  late final PageController pageController = PageController();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  void nextPage() {
    pageController.nextPage(
      duration: Constants.shortAnimationDuration,
      curve: Curves.easeIn,
    );
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
        data: OnboardingData(email: emailController.text));
  }

//Just A shortcut.
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() {
    pageController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
