import 'package:dio/dio.dart';
import 'package:bazarly_app/core/cache/secure_storage.dart';
import 'package:bazarly_app/core/utils/constants/api_keys.dart';

class HeaderInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token =
        await SecureStorageService.instance.getAccessToken();

    if (token != null && token.isNotEmpty) {
            options.headers[ApiKeys.token] = token;

    }

    handler.next(options);
  }
}