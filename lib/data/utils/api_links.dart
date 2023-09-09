class ApiLinks{
  ApiLinks._();
  static const String _baseURL = "https://craftybay.teamrabbil.com/api";
  static String brandList = "$_baseURL/BrandList";
  static String categoryList = "$_baseURL/CategoryList";
  static String userLogin(String email) => "$_baseURL/BrandList/$email";
  static String verifyLogin(String email, int otp) => "$_baseURL/VerifyLogin/$email/$otp)";
  static String createProfile = "$_baseURL/CreateProfile";
  static String readProfile = "$_baseURL/ReadProfile";
  static String cartList = "$_baseURL/CartList";
  static String createCartList = "$_baseURL/CreateCartList";
}