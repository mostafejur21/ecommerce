import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/user_read_profile_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  String _message = '';
  UserReadProfileModel _readProfileModel = UserReadProfileModel();

  String get message => _message;

  UserReadProfileModel get readProfileModel => _readProfileModel;

  Future<bool> readProfileData() async {
    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.userReadProfile);
    if (response.isSuccess) {
      _readProfileModel =
          UserReadProfileModel.fromJson(response.responseJson ?? {});
      return true;
    } else {
      _message = 'Read profile data fetch failed!';
      return false;
    }
  }
}