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
    return Stack(clipBehavior: Clip.none, children: [
      selectedIndex == 1
          ? Icon(Icons.shopping_bag_outlined,
              size: 30, color: AppColors.focusColor)
          : Icon(Icons.shopping_bag_outlined,
              size: 30, color: AppColors.primaryColor.withOpacity(0.7)),
    ]);
  }
}
