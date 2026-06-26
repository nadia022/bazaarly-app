import 'package:bazarly_app/core/cache/secure_storage.dart';
import 'package:bazarly_app/core/errors/exceptions/api_exception.dart';
import 'package:bazarly_app/core/network/api_consumer.dart';
import 'package:bazarly_app/core/utils/constants/api_endpoints.dart';
import 'package:bazarly_app/core/utils/constants/api_keys.dart';
import 'package:bazarly_app/features/auth/data/models/login_request_model.dart';
import 'package:bazarly_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:bazarly_app/features/auth/data/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  ApiConsumer apiConsumer;
  AuthRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, String>> login({required LoginRequestModel loginRequestModel}) async{
    
    try{
      Map<String, dynamic> response =await apiConsumer.post(EndPoints.login,data:{
      ApiKeys.email: loginRequestModel.email,
      ApiKeys.password: loginRequestModel.password,
    });
      final successMessage =
          response[ApiKeys.message] ?? 'Successfully logged in';
    final token = response[ApiKeys.token] ?? '';
    await SecureStorageService.instance.saveToken(token);
    return Right(successMessage);

    }
    on ApiException catch (e) {
      return Left(e.errorModel.errorMessage); // failure case
    }
    catch(e){
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, String>> signup({required SignUpRequestModel signupRequestModel})async {
    try{
      Map<String, dynamic> response =await apiConsumer.post(EndPoints.register,data:{
      ApiKeys.email: signupRequestModel.email,
      ApiKeys.password: signupRequestModel.password,
      ApiKeys.rePassword: signupRequestModel.rePassword,
      ApiKeys.name: signupRequestModel.name,
      ApiKeys.phone: signupRequestModel.phone,
    });
      final successMessage =
          response[ApiKeys.message] ?? 'Successfully signed up';
    final token = response[ApiKeys.token] ?? '';
    await SecureStorageService.instance.saveToken(token);
    return Right(successMessage);
  

    }
    on ApiException catch (e) {
      return Left(e.errorModel.errorMessage); // failure case
    }
    catch(e){
      return Left(e.toString());
    }
  }
}