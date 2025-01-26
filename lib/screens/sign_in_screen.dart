import 'package:cal_ai/screens/state/onboarding_controller.dart';
import 'package:cal_ai/screens/state/state.dart';
import 'package:cal_ai/screens/widget/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingController = ref.read(onboardingControllerProvider);
    onboardingController.listenToSignInState(context, ref);

    final state = onboardingController.signUpState(ref);

    return ListenableBuilder(
      listenable: onboardingController,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                kToolbarHeight.verticalSpace,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign In',
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
                  onPressed: state is SignInLoading ? null : () => onboardingController.signIn(ref),
                  child: state is SignInLoading ? const LoadingIndicator() : const Text('Sign In'),
                ),
                8.verticalSpace,
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Create an account?'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
