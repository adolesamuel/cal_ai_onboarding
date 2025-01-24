import 'package:cal_ai/configs/constants.dart';
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

  late final PageController pageController = PageController();
  int currentpage = 0;

  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  List<Question> questions = [
    Question(
      question: 'What are your primary health goals?',
      options: ['weight loss', 'muscle gain', 'maintaining a balanced diet)'],
    ),
    Question(
      question: 'Do you have any dietary preferences or restrictions?',
      options: ['vegetarian', 'vegan', 'gluten - free', 'allergies'],
    ),
    Question(
      question: 'What is your current activity level?',
      options: ['sedentary', 'lightly active', 'very active'],
    ),
    Question(
      question: 'How often do you typically cook at home?',
      options: ['rarely', 'sometimes', 'always'],
    ),
    Question(
      question: 'What is your age and current weight',
      type: QuestionType.input,
      options: ['age (yrs)', 'weignt (kg)'],
    ),
  ];

  void nextPage() {
    pageController.nextPage(
      duration: Constants.shortAnimationDuration,
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  void previousPage() {
    pageController.previousPage(
      duration: Constants.shortAnimationDuration,
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  void updatePage(int page) {
    currentpage = page;
    notifyListeners();
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
