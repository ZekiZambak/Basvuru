import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interview/model/cart_product_model.dart';
import 'package:interview/service/database/cart_db_helper.dart';

class CartViewModel extends GetxController{
  ValueNotifier<bool> get loading => _loading;

  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDbHelper.db;

  CartViewModel(){
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;

    _cartProductModel = await dbHelper.getAllProduct();

    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice(){
    for(int i=0; i<_cartProductModel.length; i++){
      _totalPrice += (double.parse(_cartProductModel[i].price.toString()) * double.parse(_cartProductModel[i].quantity.toString()));
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
      for(int i=0; i<_cartProductModel.length; i++){
        if(_cartProductModel[i].productId == cartProductModel.productId){
          return;
        }
      }
      var dbHelper = CartDbHelper.db;
      await dbHelper.insert(cartProductModel);
      _cartProductModel.add(cartProductModel);
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! + 1;
    _totalPrice += (double.parse(_cartProductModel[index].price.toString()));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! - 1;
    _totalPrice -= (double.parse(_cartProductModel[index].price.toString()));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

}