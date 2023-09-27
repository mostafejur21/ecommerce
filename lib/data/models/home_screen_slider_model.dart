import 'package:ecommerce/data/models/home_screen_slider_data.dart';

class HomeScreenSliderModel {
  String? msg;
  List<SliderData>? data;

  HomeScreenSliderModel({this.msg, this.data});

  HomeScreenSliderModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <SliderData>[];
      json['data'].forEach((v) {
        data!.add(SliderData.fromJson(v));
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

