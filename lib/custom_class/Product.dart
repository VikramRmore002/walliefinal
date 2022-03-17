import 'dart:convert';

/// items : [{"id":2,"name":"Default Category","children_ids":["3","4"],"children":null,"image":"https://dev.wallieboy.com/static/version1633507358/frontend/facon/facon4/en_US/Magestore_Webpos/images/category/image.jpg","position":1,"level":1,"first_category":0,"parent_id":1,"path":"1/2"},{"id":3,"name":"TOPS","children_ids":["5","10","11","30","32","40"],"children":null,"image":"https://dev.wallieboy.com/static/version1633507358/frontend/facon/facon4/en_US/Magestore_Webpos/images/category/image.jpg","position":1,"level":2,"first_category":1,"parent_id":2,"path":"1/2/3"},{"id":4,"name":"BOTTOMS","children_ids":["15","19","20","21","22","23"],"children":null,"image":"https://dev.wallieboy.com/static/version1633507358/frontend/facon/facon4/en_US/Magestore_Webpos/images/category/image.jpg","position":2,"level":2,"first_category":1,"parent_id":2,"path":"1/2/4"},{"id":5,"name":"Sweat Shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/sweat-shirt_1.jpg","position":1,"level":3,"first_category":0,"parent_id":3,"path":"1/2/3/5"},{"id":10,"name":"T shirt","children_ids":["16","17","18","26","27"],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/t-shirt_1.jpeg","position":2,"level":3,"first_category":0,"parent_id":3,"path":"1/2/3/10"},{"id":11,"name":"Hoodie","children_ids":["12"],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/hoodie_1.jpeg","position":3,"level":3,"first_category":0,"parent_id":3,"path":"1/2/3/11"},{"id":12,"name":"Zip up hoodie","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/media/catalog/category/Screenshot_2021-10-07_at_6.52.21_PM_1.png","position":1,"level":4,"first_category":0,"parent_id":11,"path":"1/2/3/11/12"},{"id":15,"name":"Shorts","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/Screenshot_2021-10-01_at_4.50.45_PM_1.png","position":1,"level":3,"first_category":0,"parent_id":4,"path":"1/2/4/15"},{"id":16,"name":"Polo T shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/polo-tshirt_1.jpeg","position":1,"level":4,"first_category":0,"parent_id":10,"path":"1/2/3/10/16"},{"id":17,"name":"Dry fit T shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/Screenshot_2021-10-07_at_6.45.34_PM_1.png","position":2,"level":4,"first_category":0,"parent_id":10,"path":"1/2/3/10/17"},{"id":18,"name":"Henley T shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/henley_1.jpeg","position":3,"level":4,"first_category":0,"parent_id":10,"path":"1/2/3/10/18"},{"id":19,"name":"Jeans","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/jeans_1.jpeg","position":2,"level":3,"first_category":0,"parent_id":4,"path":"1/2/4/19"},{"id":20,"name":"Jogger","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/jogger_1.jpeg","position":3,"level":3,"first_category":0,"parent_id":4,"path":"1/2/4/20"},{"id":21,"name":"Formal Pants","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/men-pant_1.jpeg","position":4,"level":3,"first_category":0,"parent_id":4,"path":"1/2/4/21"},{"id":22,"name":"Sweat Pants","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/media/catalog/category/Screenshot_2021-10-01_at_7.30.40_PM_1.png","position":5,"level":3,"first_category":0,"parent_id":4,"path":"1/2/4/22"},{"id":23,"name":"Cargo Pants","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/cargo-pant_1.jpeg","position":6,"level":3,"first_category":0,"parent_id":4,"path":"1/2/4/23"},{"id":26,"name":"Pocket T shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/pocket_1.jpeg","position":4,"level":4,"first_category":0,"parent_id":10,"path":"1/2/3/10/26"},{"id":27,"name":"Basic TEE","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/basic-tee_1.jpeg","position":5,"level":4,"first_category":0,"parent_id":10,"path":"1/2/3/10/27"},{"id":30,"name":"Sweater ","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/sweater_1.jpeg","position":4,"level":3,"first_category":0,"parent_id":3,"path":"1/2/3/30"},{"id":32,"name":"Shirt","children_ids":["33","34","35","36","37","38","39"],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/Screenshot_2021-10-01_at_4.48.23_PM_1.png","position":5,"level":3,"first_category":0,"parent_id":3,"path":"1/2/3/32"},{"id":33,"name":"Cotton shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/media/catalog/category/cotton-shirt_1.jpeg","position":1,"level":4,"first_category":0,"parent_id":32,"path":"1/2/3/32/33"},{"id":34,"name":"Regular Shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/regular-shirt_1.jpeg","position":2,"level":4,"first_category":0,"parent_id":32,"path":"1/2/3/32/34"},{"id":35,"name":"Chinese Shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/chines-shirt_1.jpeg","position":3,"level":4,"first_category":0,"parent_id":32,"path":"1/2/3/32/35"},{"id":36,"name":"Formal Shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/media/catalog/category/formal-shirt_1.jpeg","position":4,"level":4,"first_category":0,"parent_id":32,"path":"1/2/3/32/36"},{"id":37,"name":"Elbow patch Shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/elbow-patch_1.jpeg","position":5,"level":4,"first_category":0,"parent_id":32,"path":"1/2/3/32/37"},{"id":38,"name":"Reversible Shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/Screenshot_2021-10-07_at_7.03.25_PM_1.png","position":6,"level":4,"first_category":0,"parent_id":32,"path":"1/2/3/32/38"},{"id":39,"name":"Basis Shirt","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/basis-shirt_1.jpeg","position":7,"level":4,"first_category":0,"parent_id":32,"path":"1/2/3/32/39"},{"id":40,"name":"Blazer","children_ids":["41","42"],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/blazer_1.jpeg","position":6,"level":3,"first_category":0,"parent_id":3,"path":"1/2/3/40"},{"id":41,"name":"Regular Blazer","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/regualr-blazer_1.jpg","position":1,"level":4,"first_category":0,"parent_id":40,"path":"1/2/3/40/41"},{"id":42,"name":"Formal Blazer","children_ids":[],"children":null,"image":"https://dev.wallieboy.com/media/catalog/category/formal-blazer_1.jpeg","position":2,"level":4,"first_category":0,"parent_id":40,"path":"1/2/3/40/42"}]
/// first_categories : []
/// search_criteria : {"filter_groups":[],"current_page":1}
/// total_count : 30

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    List<Items>? items,
   // List<dynamic>? firstCategories,
    SearchCriteria? searchCriteria,
    int? totalCount,
  }) {
    _items = items;
   // _firstCategories = firstCategories;
    _searchCriteria = searchCriteria;
    _totalCount = totalCount;
  }

  Product.fromJson(dynamic json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    // if (json['first_categories'] != null) {
    //   _firstCategories = [];
    //   json['first_categories'].forEach((v) {
    //     _firstCategories?.add(_firstCategories.fromJson(v));
    //   });
    // }
    _searchCriteria = json['search_criteria'] != null
        ? SearchCriteria.fromJson(json['searchCriteria'])
        : null;
    _totalCount = json['total_count'];
  }
  List<Items>? _items;
  List<dynamic>? _firstCategories;
  SearchCriteria? _searchCriteria;
  int? _totalCount;

  List<Items>? get items => _items;
  List<dynamic>? get firstCategories => _firstCategories;
  SearchCriteria? get searchCriteria => _searchCriteria;
  int? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    // if (_firstCategories != null) {
    //   map['first_categories'] =
    //       _firstCategories?.map((v) => v.toJson()).toList();
    // }
    if (_searchCriteria != null) {
      map['search_criteria'] = _searchCriteria?.toJson();
    }
    map['total_count'] = _totalCount;
    return map;
  }
}

/// filter_groups : []
/// current_page : 1

SearchCriteria searchCriteriaFromJson(String str) =>
    SearchCriteria.fromJson(json.decode(str));
String searchCriteriaToJson(SearchCriteria data) => json.encode(data.toJson());

class SearchCriteria {
  SearchCriteria({
    List<dynamic>? filterGroups,
    int? currentPage,
  }) {
    ///_filterGroups = filterGroups;
    _currentPage = currentPage;
  }

  SearchCriteria.fromJson(dynamic json) {
    // if (json['filter_groups'] != null) {
    //   _filterGroups = [];
    //   json['filter_groups'].forEach((v) {
    //     _filterGroups?.add(.fromJson(v));
    //   });
    // }
    _currentPage = json['current_page'];
  }
  List<dynamic>? _filterGroups;
  int? _currentPage;

  List<dynamic>? get filterGroups => _filterGroups;
  int? get currentPage => _currentPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_filterGroups != null) {
      map['filter_groups'] = _filterGroups?.map((v) => v.toJson()).toList();
    }
    map['current_page'] = _currentPage;
    return map;
  }
}

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

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));
String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  Items({
    int? id,
    String? name,
    List<String>? childrenIds,
    dynamic children,
    String? image,
    int? position,
    int? level,
    int? firstCategory,
    int? parentId,
    String? path,
  }) {
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

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _childrenIds =
        json['children_ids'] != null ? json['children_ids'].cast<String>() : [];
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
