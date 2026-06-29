import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  final Connectivity connectivity;

  NetworkInterceptor(this.connectivity);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final connectivityResult = await connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: 'No internet connection',
        ),
      );
    }

    handler.next(options);
  }
}
