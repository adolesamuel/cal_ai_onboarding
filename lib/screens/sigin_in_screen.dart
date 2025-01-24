import 'package:cal_ai/screens/state/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SiginInScreen extends ConsumerStatefulWidget {
  const SiginInScreen({super.key});

  @override
  ConsumerState<SiginInScreen> createState() => _SiginInScreenState();
}

class _SiginInScreenState extends ConsumerState<SiginInScreen> {
  @override
  Widget build(BuildContext context) {
    final onboardingController = ref.read(onboardingControllerProvider);
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
              onPressed: onboardingController.signUp,
              child: const Text('Sign Up'),
            )
          ],
        );
      },
    );
  }
}
