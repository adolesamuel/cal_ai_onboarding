import 'package:cal_ai/configs/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  final String email;
  final String password;

  SignUpModel({
    required this.email,
    required this.password,
  });

  Json toJson() => _$SignUpModelToJson(this);
  factory SignUpModel.fromJson(Json json) => _$SignUpModelFromJson(json);
}
