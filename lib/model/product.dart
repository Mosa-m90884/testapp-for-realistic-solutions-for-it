class Product {
  int? id;
  String? title;
  String? description;
 late String image;
  int? comments;
  double? rate;
  String? createdAt;
  String? updatedAt;

  Product({this.id, this.title, this.description, this.comments, this.rate, this.createdAt, this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    comments = json['comments'];
    rate = json['rate'].toDouble();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['comments'] = this.comments;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}