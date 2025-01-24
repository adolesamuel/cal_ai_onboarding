import 'package:cal_ai/configs/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'onboarding_data.g.dart';

@JsonSerializable()
class OnboardingData {
  final String email;

  OnboardingData({
    required this.email,
  });

  Json toJson() => _$OnboardingDataToJson(this);
  factory OnboardingData.fromJson(Json json) => _$OnboardingDataFromJson(json);
}
