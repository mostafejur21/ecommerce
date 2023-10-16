class Urls {
  Urls._();

  static const String _baseURL = "https://craftybay.teamrabbil.com/api";
  static String brandList = "$_baseURL/BrandList";
  static String categoryList = "$_baseURL/CategoryList";

  static String userLogin(String email) => "$_baseURL/UserLogin/$email";

  static String verifyOtp(String email, String otp) =>
      '$_baseURL/VerifyLogin/$email/$otp';
  static String completeProfile = "$_baseURL/CreateProfile";
  static String createProfile = "$_baseURL/CreateProfile";
  static String userReadProfile = "$_baseURL/ReadProfile";
  static String createCartList = "$_baseURL/CreateCartList";
  static String homeScreenSlider = "$_baseURL/ListProductSlider";
  static String getCategories = '$_baseURL/CategoryList';

  static String getProductsByRemarks(String remarks) =>
      '$_baseURL/ListProductByRemark/$remarks';

  static String getProductsDetails(int productsId) =>
      '$_baseURL/ProductDetailsById/$productsId';

  static const String addToCart = '$_baseURL/CreateCartList';
  static const String getCartList = '$_baseURL/CartList';
  static const String productWishList = '$_baseURL/ProductWishList';
  static String createWishList(int id) => '$_baseURL/CreateWishList/$id';
  static String listReviewById(int id) => '$_baseURL/ListReviewByProduct/$id';
  static const String createReview = '$_baseURL/CreateProductReview';
  static String deleteCartList(int productsId) => '$_baseURL/DeleteCartList/$productsId';
}
