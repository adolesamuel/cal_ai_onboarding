import 'package:cal_ai/models/onboarding_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleRemoteProvider = Provider((ref) => SampleRemoteSource());

class FirestorePath {
  static String onboardingData(String uid) => 'onboarding-data/$uid';
  static String onboardingCollection = 'onboarding-data';
}

class SampleRemoteSource {
  final onboardingCollection = FirebaseFirestore.instance.collection(FirestorePath.onboardingCollection).withConverter(
      fromFirestore: (snapshot, _) => OnboardingData.fromJson(snapshot.data()!),
      toFirestore: (model, _) => model.toJson());

  Stream<OnboardingData?> streamOnboardingData() async* {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    yield* onboardingCollection.doc(uid).snapshots().map((e) => e.data());
  }

  Future<bool> saveOnboardingData(OnboardingData data) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    await onboardingCollection.doc(uid).set(data);
    return true;
  }

  Future<OnboardingData?> fetchOnboardingData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final result = await onboardingCollection.doc(uid).get();
    return result.data();
  }
}
