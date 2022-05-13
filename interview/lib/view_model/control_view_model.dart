import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/view/cart_view.dart';
import 'package:interview/view/home_screen.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;
  Widget _currentScreen = HomeScreen();

  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          //to search something
          break;
        }
      case 2:
        {
          _currentScreen = CartView();
          break;
        }
      case 3:
        {
          //go to profile
          break;
        }
    }
    update();
  }
}