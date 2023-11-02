import 'package:ecommerce/data/models/brands.dart';

class ListProductsByCategoriesModel {
  ListProductsByCategoriesModel({
      String? msg, 
      List<ListProductsCategoryData>? data,}){
    _msg = msg;
    _data = data;
}

  ListProductsByCategoriesModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ListProductsCategoryData.fromJson(v));
      });
    }
  }
  String? _msg;
  List<ListProductsCategoryData>? _data;
ListProductsByCategoriesModel copyWith({  String? msg,
  List<ListProductsCategoryData>? data,
}) => ListProductsByCategoriesModel(  msg: msg ?? _msg,
  data: data ?? _data,
);
  String? get msg => _msg;
  List<ListProductsCategoryData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ListProductsCategoryData {
  ListProductsCategoryData({
    int? id,
    String? title,
    String? shortDes,
    String? price,
    int? discount,
    String? discountPrice,
    String? image,
    int? stock,
    int? star,
    String? remark,
    int? categoryId,
    int? brandId,
    String? createdAt,
    String? updatedAt,
    Brand? brand,
    Category? category,}){
    _id = id;
    _title = title;
    _shortDes = shortDes;
    _price = price;
    _discount = discount;
    _discountPrice = discountPrice;
    _image = image;
    _stock = stock;
    _star = star;
    _remark = remark;
    _categoryId = categoryId;
    _brandId = brandId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _brand = brand;
    _category = category;
  }

  ListProductsCategoryData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _shortDes = json['short_des'];
    _price = json['price'];
    _discount = json['discount'];
    _discountPrice = json['discount_price'];
    _image = json['image'];
    _stock = json['stock'];
    _star = json['star'];
    _remark = json['remark'];
    _categoryId = json['category_id'];
    _brandId = json['brand_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  int? _id;
  String? _title;
  String? _shortDes;
  String? _price;
  int? _discount;
  String? _discountPrice;
  String? _image;
  int? _stock;
  int? _star;
  String? _remark;
  int? _categoryId;
  int? _brandId;
  String? _createdAt;
  String? _updatedAt;
  Brand? _brand;
  Category? _category;
  ListProductsCategoryData copyWith({  int? id,
    String? title,
    String? shortDes,
    String? price,
    int? discount,
    String? discountPrice,
    String? image,
    int? stock,
    int? star,
    String? remark,
    int? categoryId,
    int? brandId,
    String? createdAt,
    String? updatedAt,
    Brand? brand,
    Category? category,
  }) => ListProductsCategoryData(  id: id ?? _id,
    title: title ?? _title,
    shortDes: shortDes ?? _shortDes,
    price: price ?? _price,
    discount: discount ?? _discount,
    discountPrice: discountPrice ?? _discountPrice,
    image: image ?? _image,
    stock: stock ?? _stock,
    star: star ?? _star,
    remark: remark ?? _remark,
    categoryId: categoryId ?? _categoryId,
    brandId: brandId ?? _brandId,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    brand: brand ?? _brand,
    category: category ?? _category,
  );
  int? get id => _id;
  String? get title => _title;
  String? get shortDes => _shortDes;
  String? get price => _price;
  int? get discount => _discount;
  String? get discountPrice => _discountPrice;
  String? get image => _image;
  int? get stock => _stock;
  int? get star => _star;
  String? get remark => _remark;
  int? get categoryId => _categoryId;
  int? get brandId => _brandId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Brand? get brand => _brand;
  Category? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['short_des'] = _shortDes;
    map['price'] = _price;
    map['discount'] = _discount;
    map['discount_price'] = _discountPrice;
    map['image'] = _image;
    map['stock'] = _stock;
    map['star'] = _star;
    map['remark'] = _remark;
    map['category_id'] = _categoryId;
    map['brand_id'] = _brandId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }

}


class Category {
  Category({
      int? id,
      String? categoryName,
      String? categoryImg,
      String? createdAt,
      String? updatedAt,}){
    _id = id;
    _categoryName = categoryName;
    _categoryImg = categoryImg;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['categoryName'];
    _categoryImg = json['categoryImg'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _categoryName;
  String? _categoryImg;
  String? _createdAt;
  String? _updatedAt;
Category copyWith({  int? id,
  String? categoryName,
  String? categoryImg,
  String? createdAt,
  String? updatedAt,
}) => Category(  id: id ?? _id,
  categoryName: categoryName ?? _categoryName,
  categoryImg: categoryImg ?? _categoryImg,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get categoryName => _categoryName;
  String? get categoryImg => _categoryImg;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['categoryName'] = _categoryName;
    map['categoryImg'] = _categoryImg;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
