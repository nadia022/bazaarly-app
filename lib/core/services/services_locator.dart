import 'package:bazarly_app/core/network/api_consumer.dart';
import 'package:bazarly_app/core/network/dio_consumer.dart';
import 'package:bazarly_app/features/auth/data/repo/auth_repo.dart';
import 'package:bazarly_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  //! shared network services
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(getIt<Dio>()));

  //! Auth services
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(apiConsumer: getIt<ApiConsumer>()));

  
}