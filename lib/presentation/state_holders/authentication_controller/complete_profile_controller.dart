import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool _completeProfileInProgress = false;
  String _errorMessage = '';

  bool get completeProfileInProgress => _completeProfileInProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getCompleteProfile(String firstName, String lastName,
      String mobile, String city, String shippingAddress) async {
    _completeProfileInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.completeProfile,
      {
        "firstName": firstName,
        "lastName": lastName,
        "mobile": mobile,
        "city": city,
        "shippingAddress": shippingAddress
      },
    );
    _completeProfileInProgress = false;
    update();
    if (response.isSuccess && response.statusCode == 200) {
      return true;
    } else {
      _errorMessage = "profile update failed!";
      return false;
    }
  }
}
