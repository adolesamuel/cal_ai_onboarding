// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnboardingData _$OnboardingDataFromJson(Map<String, dynamic> json) =>
    OnboardingData(
      healthgoals: json['healthgoals'] as String?,
      dietaryPreference: json['dietary_preference'] as String?,
      activitylevel: json['activitylevel'] as String?,
      cookingFrequency: json['cooking_frequency'] as String?,
      ageYrs: json['age_yrs'] as String?,
      weightKG: json['weight_k_g'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$OnboardingDataToJson(OnboardingData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'healthgoals': instance.healthgoals,
      'dietary_preference': instance.dietaryPreference,
      'activitylevel': instance.activitylevel,
      'cooking_frequency': instance.cookingFrequency,
      'age_yrs': instance.ageYrs,
      'weight_k_g': instance.weightKG,
    };
