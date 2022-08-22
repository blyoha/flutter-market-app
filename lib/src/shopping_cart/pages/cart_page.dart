import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../home_page/widgets/pickup_point.dart';
import '../../main/widgets/text.dart';
import '../controllers/shopping_cart_controller.dart';
import '../widgets/shopping_cart_item.dart';

class CartPage extends StatelessWidget {

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool allChecked = true;
    const String pickupPoint = "ул. Бабушкина, 223";

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
              child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: AppColors.backgroundColor,
            child: Header(
              text: "Корзина",
              color: AppColors.primaryColor,
              size: 15,
            ),
          )),
          Container(
            margin: const EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width,
            height: double.maxFinite,
            child: SingleChildScrollView(physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const PickupPoint(
                    location: pickupPoint,
                  ),
                  // choose all
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Checkbox(
                          side: BorderSide(
                              color: AppColors.primaryColor.withOpacity(0.1),
                              width: 2),
                          activeColor: AppColors.focusColor,
                          shape: const CircleBorder(),
                          value: allChecked,
                          onChanged: (value) {allChecked = value!;},
                        ),
                        const Expanded(
                            child: Text("Выбрать все",
                                style: TextStyle(fontSize: 13))),
                        Text(
                          "Удалить выбранные",
                          style: TextStyle(
                              color: AppColors.focusColor2, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  Container(height: double.maxFinite, child: CartItems())
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class CartItems extends StatelessWidget {
  final ShoppingCartController controller = Get.find();

  CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          itemCount: controller.storeItems.length,
          itemBuilder: (context, index) {
            return ShoppingCartItem(
                controller: controller,
                storeItem: controller.storeItems.keys.toList()[index],
                quantity: controller.storeItems.values.toList()[index],
                index: index);
          }),
    );
  }
}
