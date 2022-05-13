import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interview/model/category_model.dart';
import 'package:interview/model/product_model.dart';
import 'package:interview/model/user_model.dart';
import 'package:interview/service/home_services.dart';

class HomeViewModel extends GetxController{

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  List<UserModel> get userModel => _userModel;
  final List<UserModel> _userModel = [];

  HomeViewModel(){
    getCategory();
    getMostPopularProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value){
      for(int i=0; i<value.length; i++){
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getMostPopularProducts() async {
    _loading.value = true;
    HomeService().getMostPopular().then((value){
      for(int i=0; i<value.length; i++){
        _productModel.add(ProductModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

}