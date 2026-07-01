class EndPoints {
  EndPoints._();

  //! EndPoints

  //? --- Auth  --- ;
  static String login = 'auth/signin';
  static String register = 'auth/signup';
  static String forgetPassword = 'auth/forgotPasswords';
  static String verifyOTP = 'auth/verifyResetCode';
  static String resetPassword = 'auth/resetPassword';

  //? --- Home  --- ;
  static String getAllCategories = 'categories';
  static String getAllBrands = 'brands';

  //? ------Product ----------;
  static String getAllProducts = 'products';
  static String getProductDetails(String productId) => 'products/$productId';

  //?----------Cart --------------;
  static const addToCart = 'cart';
  static const getUserCart = 'cart';
}
