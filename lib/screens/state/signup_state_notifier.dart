import 'package:cal_ai/models/onboarding_data.dart';
import 'package:cal_ai/models/sign_up_model.dart';
import 'package:cal_ai/repository/sample_repository.dart';
import 'package:cal_ai/screens/state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpStateProvider = StateNotifierProvider<SignupStateNotifier, SignUpState>((ref) {
  return SignupStateNotifier(ref.read(sampleRepoProvider));
});

class SignupStateNotifier extends StateNotifier<SignUpState> {
  final SampleRepository sampleRepository;
  SignupStateNotifier(this.sampleRepository) : super(NothingHasHappened());

  Future<void> signUp({required SignUpModel signUpInfo, required OnboardingData data}) async {
    state = SignUpLoading();

    final resultOrError = await sampleRepository.signUp(signUpInfo, data);

    state = resultOrError.fold(
      SignUpFailure.new,
      SignUpSuccess.new,
    );
  }

  Future<void> signIn({required SignUpModel signUpInfo}) async {
    state = SignInLoading();

    final resultOrError = await sampleRepository.signIn(signUpInfo);

    state = resultOrError.fold(
      SignInFailure.new,
      SignInSuccess.new,
    );
  }
}
