import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/model/cart_product_model.dart';
import 'package:interview/model/product_model.dart';
import 'package:interview/view_model/cart_view_model.dart';
import 'package:interview/widgets/custom_button.dart';
import 'package:interview/widgets/custom_text.dart';

class DetailsView extends StatelessWidget {
  ProductModel? model;

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.pink,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.pink,
                        Colors.purple,
                      ]),
                ),
                width: MediaQuery.of(context).size.width,
                height: 350,
                child: Image.network(model!.image.toString()),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 54, right: 42, top: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.pink,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            CustomText(
                              text: model!.rank.toString(),
                              color: Colors.white,
                              alignment: Alignment.center,
                              fontSize: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomText(
                      text: "\$" + model!.price.toString(),
                      fontSize: 24,
                      color: Colors.yellow.shade700,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 54, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: model!.name.toString(),
                      fontSize: 20,
                    ),
                    GetBuilder<CartViewModel>(
                      builder: (controller) => Row(
                        children: [
                          const Icon(Icons.remove_circle_outline,
                              color: Colors.pink),
                          CustomText(
                            text: "1",
                            fontSize: 20,
                          ),
                          const Icon(Icons.add_circle_outline,
                              color: Colors.pink),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 54, right: 32),
                child: CustomText(
                  text: model!.description.toString(),
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade700,
                ),
              ),
              GetBuilder<CartViewModel>(
                builder: (controller) => Padding(
                  padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: SizedBox(
                    height: 50,
                    child: CustomButton(
                      text: "Add to Cart",
                      color: Colors.pink,
                      onPressed: () {
                        controller.addProduct(
                          CartProductModel(
                            productId: model!.productId,
                            name: model!.name,
                            image: model!.image,
                            quantity: 1,
                            price: model!.price,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
