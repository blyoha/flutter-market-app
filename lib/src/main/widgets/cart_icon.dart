import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../shopping_cart/controllers/cart_controller.dart';

class CartIcon extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  final int selectedIndex;

  CartIcon({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(
        builder: (controller) => Stack(clipBehavior: Clip.none, children: [
              selectedIndex == 1
                  ? Icon(Icons.shopping_bag_outlined,
                      size: 30, color: AppColors.focusColor)
                  : Icon(Icons.shopping_bag_outlined,
                      size: 30, color: AppColors.primaryColor.withOpacity(0.7)),
              if (controller.totalItems != 0)
                Positioned(
                    top: -2,
                    right: -4,
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 15),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.focusColor2,
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 1),
                                child: Text("${controller.totalItems}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12))))))
            ]));
  }
}
