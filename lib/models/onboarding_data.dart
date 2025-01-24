import 'package:cal_ai/configs/constants.dart';
import 'package:cal_ai/models/question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'onboarding_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OnboardingData {
  final String? email;
  final String? healthgoals;
  final String? dietaryPreference;
  final String? activitylevel;
  final String? cookingFrequency;
  final String? ageYrs;
  final String? weightKG;

  OnboardingData({
    this.healthgoals,
    this.dietaryPreference,
    this.activitylevel,
    this.cookingFrequency,
    this.ageYrs,
    this.weightKG,
    this.email,
  });

  OnboardingData copyWith({
    String? email,
    String? healthgoals,
    String? dietaryPreference,
    String? activitylevel,
    String? cookingFrequency,
    String? ageYrs,
    String? weightKG,
  }) {
    return OnboardingData(
      email: email ?? this.email,
      healthgoals: healthgoals ?? this.healthgoals,
      dietaryPreference: dietaryPreference ?? this.dietaryPreference,
      activitylevel: activitylevel ?? this.activitylevel,
      cookingFrequency: cookingFrequency ?? this.cookingFrequency,
      ageYrs: ageYrs ?? this.ageYrs,
      weightKG: weightKG ?? this.weightKG,
    );
  }

  (String?, Map<String, dynamic>?) getAnswer(Questions question) {
    switch (question) {
      case Questions.healthgoals:
        return (healthgoals, null);
      case Questions.dietaryPreference:
        return (dietaryPreference, null);
      case Questions.activitylevel:
        return (activitylevel, null);
      case Questions.cookingFrequency:
        return (cookingFrequency, null);
      case Questions.ageAndWeight:
        return (
          null,
          {
            if (weightKG != null) 'weight (kg)': weightKG,
            if (ageYrs != null) 'age (yrs)': ageYrs,
          }
        );
    }
  }

  Json toJson() => _$OnboardingDataToJson(this);
  factory OnboardingData.fromJson(Json json) => _$OnboardingDataFromJson(json);
}
