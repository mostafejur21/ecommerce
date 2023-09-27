import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/api_links.dart';
import 'package:ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class OTPVerifyLoginController extends GetxController {
  bool _verifyLoginInProgress = false;

  bool get verifyLoginInProgress => _verifyLoginInProgress;

  Future<bool> verifyLogin(String email, String otp) async {
    _verifyLoginInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.verifyLogin(email, otp),
    );
    _verifyLoginInProgress = false;
    update();
    if (response.isSuccess) {
      await AuthController.setAccessToken(response.responseJson?['data']);
      return true;
    } else {
      return false;
    }
  }
}
