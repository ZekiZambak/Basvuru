import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/model/product_model.dart';
import 'package:interview/view/auth/login_screen.dart';
import 'package:interview/view/details_view.dart';
import 'package:interview/view_model/auth_view_model.dart';
import 'package:interview/view_model/home_view_model.dart';
import 'package:interview/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  ProductModel? model;

  HomeScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Image.asset("images/avatar.png"),
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 200),
                                  child: GestureDetector(
                                    onTap: () {
                                      FirebaseAuth.instance.signOut();
                                      Get.offAll(LoginScreen());
                                    },
                                    child: GetBuilder<AuthViewModel>(
                                      builder: (controller) => CustomText(
                                        text: 'Hi, Zeki',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const Icon(Icons.notifications),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              text: "What do you want to order today?",
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _searchTextFormField(),
                      const SizedBox(
                        height: 20,
                      ),
                      _listViewCategory(),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Promotions",
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.pink,
                                Colors.purple,
                              ]),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CustomText(
                                      text: "Today's Offer",
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    const SizedBox(height: 10),
                                    CustomText(
                                      text: "Free Box of Fries",
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                    const SizedBox(height: 10),
                                    CustomText(
                                      text: "On all others above \$200",
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset("images/fries.png",
                                  alignment: Alignment.topRight),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "Most Popular",
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _listViewPopular(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.brown.shade100,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: 120,
              child: ListView.separated(
                  itemCount: controller.categoryModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey.shade400,
                          ),
                          height: 80,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(controller
                                .categoryModel[index].image
                                .toString()),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomText(
                          text: controller.categoryModel[index].name.toString(),
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      )),
            ),
    );
  }

  Widget _listViewPopular() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 250,
        child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(DetailsView(
                    model: controller.productModel[index],
                  ));
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey.shade300,
                        ),
                        child: Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              children: [
                                Image.network(controller
                                    .productModel[index].image
                                    .toString()),
                                CustomText(
                                  text: controller.productModel[index].name
                                      .toString(),
                                  alignment: Alignment.center,
                                  fontSize: 18,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: CustomText(
                                        text: "\$" +
                                            controller.productModel[index].price
                                                .toString(),
                                        fontSize: 18,
                                        color: Colors.yellow.shade700,
                                      ),
                                    ),
                                    const Padding(
                                          padding:
                                              EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.add_circle_outlined,
                                            color: Colors.green,
                                          ),),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 30,
                )),
      ),
    );
  }
}
