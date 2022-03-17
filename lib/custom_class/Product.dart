import 'dart:convert';
/// id : 2
/// name : "Default Category"
/// children_ids : ["3","4"]
/// children : null
/// image : "https://dev.wallieboy.com/static/version1633507358/frontend/facon/facon4/en_US/Magestore_Webpos/images/category/image.jpg"
/// position : 1
/// level : 1
/// first_category : 0
/// parent_id : 1
/// path : "1/2"


class Product {
  Product({
      int? id, 
      String? name, 
      List<String>? childrenIds, 
      dynamic children, 
      String? image, 
      int? position, 
      int? level, 
      int? firstCategory, 
      int? parentId, 
      String? path,}){
    _id = id;
    _name = name;
    _childrenIds = childrenIds;
    _children = children;
    _image = image;
    _position = position;
    _level = level;
    _firstCategory = firstCategory;
    _parentId = parentId;
    _path = path;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _childrenIds = json['children_ids'] != null ? json['children_ids'].cast<String>() : [];
    _children = json['children'];
    _image = json['image'];
    _position = json['position'];
    _level = json['level'];
    _firstCategory = json['first_category'];
    _parentId = json['parent_id'];
    _path = json['path'];
  }
  int? _id;
  String? _name;
  List<String>? _childrenIds;
  dynamic _children;
  String? _image;
  int? _position;
  int? _level;
  int? _firstCategory;
  int? _parentId;
  String? _path;

  int? get id => _id;
  String? get name => _name;
  List<String>? get childrenIds => _childrenIds;
  dynamic get children => _children;
  String? get image => _image;
  int? get position => _position;
  int? get level => _level;
  int? get firstCategory => _firstCategory;
  int? get parentId => _parentId;
  String? get path => _path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['children_ids'] = _childrenIds;
    map['children'] = _children;
    map['image'] = _image;
    map['position'] = _position;
    map['level'] = _level;
    map['first_category'] = _firstCategory;
    map['parent_id'] = _parentId;
    map['path'] = _path;
    return map;
  }

}