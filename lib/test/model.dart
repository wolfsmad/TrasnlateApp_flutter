class Product {
  int id;
  List<String> category;
  List<Images> images;
  String name;
  String excerpt;
  String description;
  int amount;
  int originalAmount;
  int discountAmount;
  String technicalDescription;
  int countOfSell;
  String code;
  String status;
  String type;
  bool isSpecial;
  List<int> tag;
  List<int> region;
  List<int> mantaghe;
  List<int> city;

  Product(
      {this.id,
      this.category,
      this.images,
      this.name,
      this.excerpt,
      this.description,
      this.amount,
      this.originalAmount,
      this.discountAmount,
      this.technicalDescription,
      this.countOfSell,
      this.code,
      this.status,
      this.type,
      this.isSpecial,
      this.tag,
      this.region,
      this.mantaghe,
      this.city});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'].cast<String>();
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    name = json['name'];
    excerpt = json['excerpt'];
    description = json['description'];
    amount = json['amount'];
    originalAmount = json['original_amount'];
    discountAmount = json['discount_amount'];
    technicalDescription = json['technical_description'];
    countOfSell = json['count_of_sell'];
    code = json['code'];
    status = json['status'];
    type = json['type'];
    isSpecial = json['is_special'];
    tag = json['tag'].cast<int>();
    region = json['region'].cast<int>();
    mantaghe = json['mantaghe'].cast<int>();
    city = json['city'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['excerpt'] = this.excerpt;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['original_amount'] = this.originalAmount;
    data['discount_amount'] = this.discountAmount;
    data['technical_description'] = this.technicalDescription;
    data['count_of_sell'] = this.countOfSell;
    data['code'] = this.code;
    data['status'] = this.status;
    data['type'] = this.type;
    data['is_special'] = this.isSpecial;
    data['tag'] = this.tag;
    data['region'] = this.region;
    data['mantaghe'] = this.mantaghe;
    data['city'] = this.city;
    return data;
  }
}

class Images {
  int id;
  String image;
  String alt;
  int product;

  Images({this.id, this.image, this.alt, this.product});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    alt = json['alt'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['alt'] = this.alt;
    data['product'] = this.product;
    return data;
  }
}
