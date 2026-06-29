//! --- JSON KEYS (The names that Dio sends and receives) ---
//! --- JSON KEYS (The names that Dio sends and receives) ---

abstract class ApiKeys {
  ApiKeys._();

  //? --- Common Response & General Keys ---
  static const String data = 'data';
  static const String message = 'message';
  static const String status = 'status';
  static const String validationErrors = 'validationErrors';
  static const String token = 'token';

  //? --- Auth Keys ---
  static const String user = 'user';
  static const String name = 'name';
  static const String email = 'email';
  static const String password = 'password';
  static const String rePassword = 'rePassword';
  static const String phone = 'phone';
  static const String role = 'role';
}
