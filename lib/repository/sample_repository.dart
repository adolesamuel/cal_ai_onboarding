import 'package:cal_ai/configs/failure.dart';
import 'package:cal_ai/configs/service.dart';
import 'package:cal_ai/models/app_user.dart';
import 'package:cal_ai/models/onboarding_data.dart';
import 'package:cal_ai/models/sign_up_model.dart';
import 'package:cal_ai/source/sample_remote_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final sampleRepoProvider = Provider(
  (ref) => SampleRepository(sampleRemoteSource: ref.read(sampleRemoteProvider)),
);

class SampleRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SampleRemoteSource sampleRemoteSource;

  SampleRepository({required this.sampleRemoteSource});

  Future<Either<Failure, AppUser>> signUp(SignUpModel data, OnboardingData onboadingData) {
    return ServiceRunner<AppUser>().run(
      call: _firebaseAuth.createUserWithEmailAndPassword(email: data.email, password: data.password).then(
        (value) {
          saveOnboardingInfo(onboadingData);
          return AppUser.fromFirebaseUser(
            value.user!,
          );
        },
      ),
      name: "Sign Up",
    );
  }

  Future<Either<Failure, bool>> saveOnboardingInfo(OnboardingData data) {
    return ServiceRunner<bool>().run(
      call: sampleRemoteSource.saveOnboardingData(data),
      name: "Onboarding",
    );
  }

  Future<Either<Failure, AppUser>> signIn(SignUpModel data) {
    return ServiceRunner<AppUser>().run(
      call: _firebaseAuth.signInWithEmailAndPassword(email: data.email, password: data.password).then(
        (value) {
          return AppUser.fromFirebaseUser(
            value.user!,
          );
        },
      ),
      name: "Sign In",
    );
  }

  Future<Either<Failure, OnboardingData?>> getOnboardingData() {
    return ServiceRunner<OnboardingData?>().run(
      call: sampleRemoteSource.fetchOnboardingData(),
      name: 'Fetch OnboardingData',
    );
  }
}
