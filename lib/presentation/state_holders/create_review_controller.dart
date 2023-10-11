import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController{
  bool _createReviewInProgress = false;
  String _message = '';

  bool get createReviewInProgress => _createReviewInProgress;
  String get message => _message;

  Future<bool> createReview (String description, int product_id)async {
    _createReviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(Urls.createReview, {

        "description": description,
        "product_id":product_id
    });

    _createReviewInProgress = false;
    update();
    if (response.isSuccess && response.statusCode == 200) {
      return true;
    } else {
      _message = "profile update failed!";
      return false;
    }
  }
}