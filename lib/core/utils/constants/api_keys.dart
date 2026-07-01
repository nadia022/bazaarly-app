//! --- JSON KEYS (The names that Dio sends and receives) ---

abstract class ApiKeys {
  ApiKeys._();

  //? --- Common Response & General Keys ---
  static const String data = 'data';
  static const String message = 'message';
  static const String status = 'status';
  static const String validationErrors = 'validationErrors';
  static const String token = 'token';
  static const String results = 'results';
  static const String metaData = 'metadata';
  static const String id = '_id';

  //? --- Auth Keys ---
  static const String user = 'user';
  static const String name = 'name';
  static const String email = 'email';
  static const String password = 'password';
  static const String rePassword = 'rePassword';
  static const String phone = 'phone';
  static const String role = 'role';

  //? --- Shared Home & Product Keys ---
  static const String slug = 'slug';
  static const String image = 'image';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';

  //? --- Product Keys ---
  static const String sold = 'sold';
  static const String images = 'images';
  static const String subcategory = 'subcategory';
  static const String ratingsQuantity = 'ratingsQuantity';
  static const String title = 'title';
  static const String description = 'description';
  static const String quantity = 'quantity';
  static const String price = 'price';
  static const String imageCover = 'imageCover';
  static const String category = 'category';
  static const String brand = 'brand';
  static const String ratingsAverage = 'ratingsAverage';
  static const String priceAfterDiscount = 'priceAfterDiscount';
  static const String available = 'available';
  static const String availableColors = 'availableColors';

 //? -------- Cart Keys ---------
static const String productId = 'productId';
static const String cartId = 'cartId';
static const String cartOwner = 'cartOwner';
static const String numOfCartItems = 'numOfCartItems';
static const String products = 'products';
static const String product = 'product';
static const String count = 'count';
static const String totalCartPrice = 'totalCartPrice';
static const String version = '__v';
}
