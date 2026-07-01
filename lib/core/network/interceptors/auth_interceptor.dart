import 'package:bazarly_app/core/cache/get_storage.dart';
import 'package:bazarly_app/core/cache/secure_storage.dart';
import 'package:bazarly_app/core/utils/constants/api_endpoints.dart';
import 'package:bazarly_app/core/utils/constants/cache_keys.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = await SecureStorageService.instance.getAccessToken();

    if (token != null) {
      options.headers[CacheKeys.token] = token;
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final guestPaths = [
      EndPoints.forgetPassword,
      EndPoints.verifyOTP,
      EndPoints.resetPassword,
      EndPoints.login,
      EndPoints.register,
    ];

    final bool isGuestRequest = guestPaths.any(
      (path) => err.requestOptions.path.contains(path),
    );

    if (isGuestRequest) {
      return handler.next(err);
    }

    if (err.response?.statusCode == 401) {
      await _performLogout();
    }

    return handler.next(err);
  }

  Future<void> _performLogout() async {
    await SecureStorageService.instance.clearAll();
    await GetStorageHelper.erase();
    // TODO: Navigate to login screen
  }
}
