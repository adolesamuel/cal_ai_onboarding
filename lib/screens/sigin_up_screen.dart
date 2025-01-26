import 'package:cal_ai/screens/sign_in_screen.dart';
import 'package:cal_ai/screens/state/onboarding_controller.dart';
import 'package:cal_ai/screens/state/state.dart';
import 'package:cal_ai/screens/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingController = ref.read(onboardingControllerProvider);
    onboardingController.listenToSignInState(context, ref);

    final state = onboardingController.signUpState(ref);

    return ListenableBuilder(
      listenable: onboardingController,
      builder: (context, _) {
        return Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Create an account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
            64.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: onboardingController.emailController,
                    decoration: const InputDecoration(hintText: 'Enter Email'),
                  ),
                  16.verticalSpace,
                  TextFormField(
                    controller: onboardingController.passwordController,
                    decoration: const InputDecoration(hintText: 'Enter Password'),
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            ElevatedButton(
              onPressed: state is SignUpLoading ? null : () => onboardingController.signUp(ref),
              child: state is SignUpLoading ? const LoadingIndicator() : const Text('Sign Up'),
            ),
            8.verticalSpace,
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ));
              },
              child: const Text('Already have an account? Sign In'),
            )
          ],
        );
      },
    );
  }
}
