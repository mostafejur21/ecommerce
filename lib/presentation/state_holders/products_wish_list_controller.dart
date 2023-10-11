import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/products_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class ProductsWishListController extends GetxController {
  bool _getWishListInProgress = false;
  String _message = "";
  ProductModel _productModel = ProductModel();

  bool get getProductsWishListInProgress => _getWishListInProgress;

  ProductModel get productModel => _productModel;

  String get message => _message;

  Future<bool> getWishList() async {
    _getWishListInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.productWishList);
    _getWishListInProgress = false;
    if (response.isSuccess && response.statusCode == 200) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'wish list products get failed';
      update();
      return false;
    }
  }
}
