import 'package:ecommerce/data/models/products_details.dart';

class ProductsDetailsModel {
  String? msg;
  List<ProductsDetails>? data;

  ProductsDetailsModel({this.msg, this.data});

  ProductsDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProductsDetails>[];
      json['data'].forEach((v) {
        data!.add(ProductsDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}