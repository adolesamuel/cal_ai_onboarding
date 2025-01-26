import 'package:cal_ai/configs/constants.dart';
import 'package:cal_ai/screens/state/home_page_state_notifier.dart';
import 'package:cal_ai/screens/state/onboarding_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    final state = ref.watch(homePageStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Cal-AI'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              user?.email ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            64.verticalSpace,
            if (state is OnboardingDataLoading)
              const Text('Fetching Onboarding Data')
            else if (state is OnboardingDataFailure)
              Text(state.failure.message)
            else if (state is OnboardingDataSuccess)
              Builder(
                builder: (context) {
                  final onboardingData = state.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EntryWidget(
                        title: 'Health Goals',
                        value: onboardingData?.healthgoals ?? '',
                      ),
                      EntryWidget(
                        title: 'Dietary Preference',
                        value: onboardingData?.dietaryPreference ?? '',
                      ),
                      EntryWidget(
                        title: 'Activity Level',
                        value: onboardingData?.activitylevel ?? '',
                      ),
                      EntryWidget(
                        title: 'Cooking Frequency',
                        value: onboardingData?.cookingFrequency ?? '',
                      ),
                      EntryWidget(
                        title: 'Age (yrs)',
                        value: onboardingData?.ageYrs ?? '',
                      ),
                      EntryWidget(
                        title: 'Weight (kg)',
                        value: onboardingData?.weightKG ?? '',
                      ),
                    ],
                  );
                },
              ),
            64.verticalSpace,
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(onboardingControllerProvider).signOut();
                },
                child: const Text('Sign Out'),
              ),
            ),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class EntryWidget extends StatelessWidget {
  final String title;
  final String value;
  const EntryWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            value.capitalize(),
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
