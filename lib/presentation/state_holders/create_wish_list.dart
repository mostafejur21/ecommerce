import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/products_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class CreateWishListController extends GetxController {
  bool _getCreateWishListInProgress = false;
  String _message = "";
  ProductModel _productModel = ProductModel();

  bool get getCreateWishListInProgress => _getCreateWishListInProgress;

  ProductModel get productModel => _productModel;

  String get message => _message;

  Future<bool> createWishList(int id) async {
    _getCreateWishListInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.createWishList(id));
    _getCreateWishListInProgress = false;
    if (response.isSuccess && response.statusCode == 200) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Create wish list products failed';
      update();
      return false;
    }
  }
}
