import 'package:ecommerce/data/models/invoice_create_model.dart';
import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utils/url_links.dart';
import 'package:get/get.dart';

class   CreateInvoiceController extends GetxController{
  bool _isInvoiceCreated = false;
  String _message = '';
  InvoiceCreateResponseModel _createResponseModel = InvoiceCreateResponseModel();
  bool get isInvoiceCreated => _isInvoiceCreated;
  String get message => _message;
  InvoiceCreateData? get createResponseModel => _createResponseModel.data?.first;

  Future<bool>createInvoice()async{
    _isInvoiceCreated = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.createInvoice);
    _isInvoiceCreated = false;
    if(response.statusCode == 200 && response.responseJson!["msg"] == "success"){
      _createResponseModel = InvoiceCreateResponseModel.fromJson(response.responseJson!);
      _message = _createResponseModel.msg!;
      update();
      return true;
    }else{
      _message = "Something went wrong!";
      update();
      return false;
    }
  }
}