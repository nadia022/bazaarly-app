import 'package:bazarly_app/features/auth/data/models/login_request_model.dart';
import 'package:bazarly_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<String, String>> login({required LoginRequestModel loginRequestModel});
  Future<Either<String, String>> signup({required SignUpRequestModel signupRequestModel});

}