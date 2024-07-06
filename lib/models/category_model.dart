import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    List<Data>? data,
  }) {
    _data = data;
  }

  CategoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;
  CategoryModel copyWith({
    List<Data>? data,
  }) =>
      CategoryModel(
        data: data ?? _data,
      );
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    num? id,
    dynamic parentId,
    String? name,
    String? slug,
    dynamic description,
    num? position,
    String? image,
    List<Children>? children,
    List<dynamic>? products,
  }) {
    _id = id;
    _parentId = parentId;
    _name = name;
    _slug = slug;
    _description = description;
    _position = position;
    _image = image;
    _children = children;
    _products = products;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _parentId = json['parentId'];
    _name = json['name'];
    _slug = json['slug'];
    _description = json['description'];
    _position = json['position'];
    _image = json['image'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(Children.fromJson(v));
      });
    }
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        /// Dynamic.fromJson(v) 👉 Products.fromJson(v)
        _products?.add(Products.fromJson(v));
      });
    }
  }
  num? _id;
  dynamic _parentId;
  String? _name;
  String? _slug;
  dynamic _description;
  num? _position;
  String? _image;
  List<Children>? _children;
  List<dynamic>? _products;
  Data copyWith({
    num? id,
    dynamic parentId,
    String? name,
    String? slug,
    dynamic description,
    num? position,
    String? image,
    List<Children>? children,
    List<dynamic>? products,
  }) =>
      Data(
        id: id ?? _id,
        parentId: parentId ?? _parentId,
        name: name ?? _name,
        slug: slug ?? _slug,
        description: description ?? _description,
        position: position ?? _position,
        image: image ?? _image,
        children: children ?? _children,
        products: products ?? _products,
      );
  num? get id => _id;
  dynamic get parentId => _parentId;
  String? get name => _name;
  String? get slug => _slug;
  dynamic get description => _description;
  num? get position => _position;
  String? get image => _image;
  List<Children>? get children => _children;
  List<dynamic>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parentId'] = _parentId;
    map['name'] = _name;
    map['slug'] = _slug;
    map['description'] = _description;
    map['position'] = _position;
    map['image'] = _image;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Children childrenFromJson(String str) => Children.fromJson(json.decode(str));
String childrenToJson(Children data) => json.encode(data.toJson());

class Children {
  Children({
    num? id,
    num? parentId,
    String? name,
    String? slug,
    dynamic description,
    num? position,
    String? image,
    List<Products>? products,
  }) {
    _id = id;
    _parentId = parentId;
    _name = name;
    _slug = slug;
    _description = description;
    _position = position;
    _image = image;
    _products = products;
  }

  Children.fromJson(dynamic json) {
    _id = json['id'];
    _parentId = json['parentId'];
    _name = json['name'];
    _slug = json['slug'];
    _description = json['description'];
    _position = json['position'];
    _image = json['image'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  num? _id;
  num? _parentId;
  String? _name;
  String? _slug;
  dynamic _description;
  num? _position;
  String? _image;
  List<Products>? _products;
  Children copyWith({
    num? id,
    num? parentId,
    String? name,
    String? slug,
    dynamic description,
    num? position,
    String? image,
    List<Products>? products,
  }) =>
      Children(
        id: id ?? _id,
        parentId: parentId ?? _parentId,
        name: name ?? _name,
        slug: slug ?? _slug,
        description: description ?? _description,
        position: position ?? _position,
        image: image ?? _image,
        products: products ?? _products,
      );
  num? get id => _id;
  num? get parentId => _parentId;
  String? get name => _name;
  String? get slug => _slug;
  dynamic get description => _description;
  num? get position => _position;
  String? get image => _image;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parentId'] = _parentId;
    map['name'] = _name;
    map['slug'] = _slug;
    map['description'] = _description;
    map['position'] = _position;
    map['image'] = _image;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    num? id,
    String? name,
    String? slug,
    String? image,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _image = image;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _slug;
  String? _image;
  Products copyWith({
    num? id,
    String? name,
    String? slug,
    String? image,
  }) =>
      Products(
        id: id ?? _id,
        name: name ?? _name,
        slug: slug ?? _slug,
        image: image ?? _image,
      );
  num? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['image'] = _image;
    return map;
  }
}
