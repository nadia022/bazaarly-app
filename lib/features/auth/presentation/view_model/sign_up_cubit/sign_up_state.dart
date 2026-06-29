part of 'sign_up_cubit.dart';

sealed class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String message;
  SignUpSuccess(this.message);
}

class SignUpFailure extends SignUpState {
  final String errorMessage;
  SignUpFailure(this.errorMessage);
}
