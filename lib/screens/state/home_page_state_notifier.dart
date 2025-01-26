import 'package:cal_ai/configs/failure.dart';
import 'package:cal_ai/models/onboarding_data.dart';
import 'package:cal_ai/repository/sample_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageStateProvider = StateNotifierProvider<HomePageStateNotifier, HomePageState>((ref) {
  return HomePageStateNotifier(ref.read(sampleRepoProvider));
});

class HomePageStateNotifier extends StateNotifier<HomePageState> {
  final SampleRepository sampleRepository;

  HomePageStateNotifier(this.sampleRepository) : super(HomePageState()) {
    fetchOnboardingData();
  }
  Future<void> fetchOnboardingData() async {
    state = OnboardingDataLoading();

    final resultOrError = await sampleRepository.getOnboardingData();

    state = resultOrError.fold(
      OnboardingDataFailure.new,
      OnboardingDataSuccess.new,
    );
  }
}

class HomePageState {}

class OnboardingDataLoading extends HomePageState {}

class OnboardingDataFailure extends HomePageState {
  final Failure failure;
  OnboardingDataFailure(this.failure);
}

class OnboardingDataSuccess extends HomePageState {
  final OnboardingData? data;

  OnboardingDataSuccess(this.data);
}
