import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/products_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class CategoryProductListController extends GetxController {
  bool _getCategoryProductsListInProgress = false;
  ProductModel _productModel = ProductModel();
  String _message = '';

  ProductModel get productModel => _productModel;

  bool get getCategoryProductsListInProgress =>
      _getCategoryProductsListInProgress;

  String get message => _message;

  Future<bool> getProductsByCategory(int categoryId) async {
    _getCategoryProductsListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller
        .getRequest(Urls.listProductsByCategory(categoryId));
    _getCategoryProductsListInProgress = false;
    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Product category list data fetch failed!';
      update();
      return false;
    }
  }
}