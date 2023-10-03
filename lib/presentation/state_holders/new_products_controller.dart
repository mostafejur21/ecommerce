import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/products_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class NewProductsController extends GetxController {
  bool _getNewProductsInProgress = false;
  String _message = "";
  ProductModel _productModel = ProductModel();

  bool get getNewInProgress => _getNewProductsInProgress;

  ProductModel get productModel => _productModel;

  String get message => _message;

  Future<bool> getNewProducts() async {
    _getNewProductsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductsByRemarks('special'));
    _getNewProductsInProgress = false;
    if (response.isSuccess && response.statusCode == 200) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Popular products get failed';
      update();
      return false;
    }
  }
}
