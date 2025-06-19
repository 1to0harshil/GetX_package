class GetProductListModel {
  GetProductListModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  GetProductListModel.fromJson(Map<String, dynamic> json) {
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  late final List<Products> products;
  late final int total;
  late final int skip;
  late final int limit;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['products'] = products.map((e) => e.toJson()).toList();
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Products {
  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    //required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'] == null
        ? 0.0
        : json['discountPercentage'].toDouble();
    //   rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = List.castFrom<dynamic, String>(json['images']);
  }

  int? id;
  String? title;
  String? description;
  double? price;
  double? discountPercentage;

  //late final int rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    //  _data['rating'] = rating;
    data['stock'] = stock;
    data['brand'] = brand;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    data['images'] = images;
    return data;
  }
}
