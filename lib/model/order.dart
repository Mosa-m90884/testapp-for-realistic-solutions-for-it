class Order {
  int? id;
  int? userId;
  int? productId;
  String? status;
  String? createdAt;
  String? updatedAt;
  OrderUser? user;
  OrderProduct? product;

  Order(
      {this.id,
        this.userId,
        this.productId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.product});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new OrderUser.fromJson(json['user']) : null;
    product =
    json['product'] != null ? new OrderProduct.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class OrderUser {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  OrderUser(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt});

  OrderUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OrderProduct {
  int? id;
  String? title;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  OrderProduct(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt});

  OrderProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}