import 'package:ecommerce/data/models/cart_list_data.dart';
import 'package:ecommerce/data/models/cart_list_model.dart';
import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _cartListInProgress = false;
  CartListModel _cartListModel = CartListModel();
  double _totalPrice = 0;
  String _message = '';

  bool get cartListInProgress => _cartListInProgress;

  CartListModel get cartListModel => _cartListModel;

  double get totalPrice => _totalPrice;

  String get message => _message;

  Future<bool> getCartList() async {
    _cartListInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getCartList);
    _cartListInProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseJson!);
      _calculateTotalPrice();
      update();
      return true;
    } else {
      _message = "Cart list fetch failed!";
      return false;
    }
  }

  void changeItem(int cartId, int noOfItems) {
    _cartListModel.data
        ?.firstWhere((cartData) => cartData.id == cartId)
        .numberOfItems = noOfItems;
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    _totalPrice = 0;
    for (CartData data in _cartListModel.data ?? []) {
      _totalPrice += (data.numberOfItems *
          (double.tryParse(data.product?.price ?? '0') ?? 0));
    }
    update();
  }
}
