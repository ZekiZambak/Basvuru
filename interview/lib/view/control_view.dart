import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/view/auth/login_screen.dart';
import 'package:interview/view_model/auth_view_model.dart';
import 'package:interview/view_model/control_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.home, color: Colors.grey)),
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.search, color: Colors.grey)),
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.shopping_cart, color: Colors.grey)),
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.perm_identity, color: Colors.grey)),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
      ),
    );
  }
}
