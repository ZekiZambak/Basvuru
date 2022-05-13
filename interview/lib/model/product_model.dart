class ProductModel{
  String? productId, name, image, description, rank, price;

  ProductModel({this.productId, this.name, this.image, this.description, this.rank, this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if(map.isEmpty) {
      return;
    }

    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    rank = map['rank'];
    price = map['price'];
  }

  toJson(){
    return{
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'rank': rank,
      'price': price,
    };
  }

}