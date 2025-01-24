import 'package:cal_ai/configs/failure.dart';
import 'package:cal_ai/models/app_user.dart';

class SignUpState {}

class NothingHasHappened extends SignUpState {}

class SignUpFailure extends SignUpState {
  final Failure failure;

  SignUpFailure(this.failure);
}

class SignUpSuccess extends SignUpState {
  final AppUser user;

  SignUpSuccess(this.user);
}

class SignUpLoading extends SignUpState {}
