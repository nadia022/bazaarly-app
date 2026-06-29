import 'package:bazarly_app/core/cache/get_storage.dart';
import 'package:bazarly_app/core/cache/secure_storage.dart';
import 'package:bazarly_app/core/utils/constants/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    /// APIs that don't require authentication
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

    /// Don't logout on auth errors coming from guest endpoints
    if (isGuestRequest) {
      return handler.next(err);
    }

    /// If token is invalid or expired
    if (err.response?.statusCode == 401) {
      await _performLogout();
    }

    return handler.next(err);
  }

  Future<void> _performLogout() async {
    await SecureStorageService.instance.clearAll();
    await GetStorageHelper.erase();

    //TODO: Navigate to login screen

    // AppRouter.navigatorKey.currentState?.context.go(
    //   RoutesName.login,
    // );
  }
}
