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
        data!.add(new ProductsDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




