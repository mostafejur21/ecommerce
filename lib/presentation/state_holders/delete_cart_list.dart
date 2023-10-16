import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/products_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class DeleteCartListController extends GetxController{
  ProductModel _productModel = ProductModel();
  ProductModel get productModel => _productModel;
  String _message = '';
  String get message => _message;
  Future<bool> deleteCartId(int id) async {
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.deleteCartList(id));
    if(response.isSuccess && response.statusCode == 200){
    
      return true;
    }else{
      _message = "delete cart list failed";
      return false;
    }
  }
}