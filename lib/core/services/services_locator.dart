import 'package:bazarly_app/core/network/api_consumer.dart';
import 'package:bazarly_app/core/network/dio_consumer.dart';
import 'package:bazarly_app/features/auth/data/repo/auth_repo.dart';
import 'package:bazarly_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:bazarly_app/features/cart/data/repos/cart_repo.dart';
import 'package:bazarly_app/features/cart/data/repos/cart_repo_impl.dart';
import 'package:bazarly_app/features/home/data/repos/home_repo.dart';
import 'package:bazarly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bazarly_app/features/product/data/repos/product_repo.dart';
import 'package:bazarly_app/features/product/data/repos/product_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  //! shared network services
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(getIt<Dio>()));

  //! Auth services
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );

  //! home services
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );

  //! product
  getIt.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );

  //! Cart
  getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
}
