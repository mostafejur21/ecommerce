import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/products_details.dart';
import 'package:ecommerce/data/models/products_details_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class ProductsDetailsController extends GetxController {
  bool _getProductsDetailsInProgress = false;
  ProductsDetails _productsDetails = ProductsDetails();
  final List<String> _availableColor = [];
  List<String> _availableSizes = [];
  String _errorMessage = '';

  bool get getProductsDetailsInProgress => _getProductsDetailsInProgress;

  ProductsDetails get productsDetails => _productsDetails;

  List<String> get availableColor => _availableColor;

  List<String> get availableSizes => _availableSizes;

  String get errorMessage => _errorMessage;

  Future<bool> getProductsDetails(int productsId) async {
    _getProductsDetailsInProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductsDetails(productsId));
    _getProductsDetailsInProgress = false;
    if (response.isSuccess && response.statusCode == 200) {
      _productsDetails =
          ProductsDetailsModel.fromJson(response.responseJson ?? {})
              .data!
              .first;

      _convertedStringToColor(_productsDetails.color ?? "");
      _convertStringToSizes(_productsDetails.size ?? "");
      update();
      return true;
    } else {
      _errorMessage = "Fetch products details has been failed! try again";
      update();
      return false;
    }
  }

  void _convertedStringToColor(String color) {
    final List<String> splittedColor = color.split(',');
    for (String c in splittedColor) {
      if (c.isNotEmpty) {
        _availableColor.add(c);
      }
    }
  }

  void _convertStringToSizes(String sizes) {
    _availableSizes = sizes.split(',');
  }
}
