import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/view_model/cart_view_model.dart';
import 'package:interview/view_model/control_view_model.dart';
import 'package:interview/widgets/custom_button.dart';
import 'package:interview/widgets/custom_text.dart';
import 'package:interview/widgets/custom_text_form_field.dart';

class CartView extends StatelessWidget {
  String? name;
  CartView({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            GetBuilder<CartViewModel>(
                builder: (controller) => CustomText(
                    text: controller.cartProductModel.length.toString() +
                        " items in Cart",
                    fontSize: 30)),
            Expanded(
              child: GetBuilder<CartViewModel>(
                builder: (controller) => Container(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.brown.shade200,
                                    ),
                                    child: Image.network(
                                      controller.cartProductModel[index].image
                                          .toString(),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        CustomText(
                                          text: controller
                                              .cartProductModel[index].name
                                              .toString(),
                                          fontSize: 20,
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        CustomText(
                                          text: "\$" +
                                              controller
                                                  .cartProductModel[index].price
                                                  .toString(),
                                          fontSize: 20,
                                          color: Colors.yellow.shade700,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              child: const Icon(
                                                  Icons.remove_circle_outline,
                                                  color: Colors.pink),
                                              onTap: () {
                                                controller
                                                    .decreaseQuantity(index);
                                              },
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            CustomText(
                                              text: controller
                                                  .cartProductModel[index]
                                                  .quantity
                                                  .toString(),
                                              fontSize: 20,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            GestureDetector(
                                                child: const Icon(
                                                    Icons.add_circle_outline,
                                                    color: Colors.pink),
                                                onTap: () {
                                                  controller
                                                      .increaseQuantity(index);
                                                }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 110, left: 30),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.close,
                                            color: Colors.red)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: controller.cartProductModel.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 25,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomText(
              text: "Order Instructions",
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hintText: "Instruction",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintColor: Colors.grey,
              isObscure: false,
              onSaved: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Total:", fontSize: 22),
                  GetBuilder<CartViewModel>(
                    builder: (controller) => CustomText(
                      text: "\$" + controller.totalPrice.toString(),
                      color: Colors.yellow.shade700,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<CartViewModel>(
              builder:(controller) => SizedBox(
                width: 280,
                height: 50,
                child: CustomButton(
                  text: "Checkout",
                  color: Colors.pink,
                  onPressed: () {
                    showDialog(context: context, builder: (context)
                    => AlertDialog(
                      title: const Text("Order Sent"),
                      content: const Text(
                        "Order sent to firebase"
                      ),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))
                      ],
                    ));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<ControlViewModel>(
              builder: (controller) => GestureDetector(
                  onTap: (){
                    controller.changeSelectedValue(0);
                  },
                  child: CustomText(
                    text: "Back to Menu",
                    fontSize: 18,
                    alignment: Alignment.center,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
