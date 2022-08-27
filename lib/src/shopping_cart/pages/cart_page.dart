import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../home_page/widgets/pickup_point.dart';
import '../../main/widgets/text.dart';
import '../../store_items/widgets/cart_total.dart';
import '../controllers/cart_controller.dart';
import '../widgets/cart_item.dart';

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
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: AppColors.backgroundColor,
            child: Header(
              text: "Корзина",
              color: AppColors.primaryColor,
              size: 20,
            ),
          )),
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 46),
            width: MediaQuery.of(context).size.width,
            height: double.maxFinite,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                          onChanged: (value) {
                            allChecked = value!;
                          },
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
                  CartItems(),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: CartTotal())
        ],
      )),
    );
  }
}

class CartItems extends StatelessWidget {
  final CartController controller = Get.find();

  CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.totalItems != 0) {
      return Obx(
        () => Column(
          children: List.generate(
              controller.storeItems.length,
              (index) => CartItem(
                  controller: controller,
                  storeItem: controller.storeItems.keys.toList()[index],
                  quantity: controller.storeItems.values.toList()[index],
                  index: index)),
        ),
      );
    } else {
      return const Center(child: Text("Корзина пуста"));
    }
  }
}
