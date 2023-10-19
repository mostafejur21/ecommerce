import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:ecommerce/presentation/state_holders/authentication_controller/auth_controller.dart';
import 'package:get/get.dart';

class OTPVerifyLoginController extends GetxController {
  bool _verifyLoginInProgress = false;
  static bool _isProfileComplete = false;
  static bool get isProfileComplete => _isProfileComplete;
  bool get verifyLoginInProgress => _verifyLoginInProgress;

  Future<bool> verifyLogin(String email, String otp) async {
    _verifyLoginInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.verifyOtp(email, otp),
    );
    _verifyLoginInProgress = false;
    update();
    if (response.isSuccess && response.statusCode == 200) {
      await AuthController.setAccessToken(response.responseJson?['data']);
      return true;
    } else {
      return false;
    }
  }
  void setProfile (){
    _isProfileComplete = true;
    update();
  }
}
