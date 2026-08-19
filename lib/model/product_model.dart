class ProductsModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  List<String>? images;
  String? thumbnail;
  bool? isFavorite;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.images,
    this.thumbnail,
    this.isFavorite = false,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = (json['price'] as num?)?.toDouble();
    description = json['description'];
    category = json['category'];
    images = (json['images'] as List?)?.cast<String>() ?? [];
    thumbnail = json['thumbnail'];
    isFavorite = json['isFavorite'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    data['isFavorite'] = isFavorite;
    return data;
  }
}
