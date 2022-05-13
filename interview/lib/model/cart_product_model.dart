class CartProductModel{
  String? productId, name, image, price;
  int? quantity;

  CartProductModel({this.productId, this.name, this.image, this.price, this.quantity});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if(map.isEmpty) {
      return;
    }

    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
  }

  toJson(){
    return{
      'productId': productId,
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }

}