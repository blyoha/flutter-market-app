import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../main/widgets/text.dart';
import '../../shopping_cart/controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();

  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            border: Border(
                top: BorderSide(
                    color: AppColors.primaryColor.withOpacity(0.1)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // info
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // total price
                Text(
                  "${controller.totalPrice}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                // items count
                Text(
                  "${controller.totalItems} товаров",
                  style:
                      TextStyle(color: AppColors.secondaryColor, fontSize: 12),
                )
              ],
            ),
            // button
            const TotalButton()
          ],
        ),
      ),
    );
  }
}

class TotalButton extends StatelessWidget {
  const TotalButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 28,
        child: TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.focusColor)),
            onPressed: () {},
            child: const Header(
              text: "Перейти к оформлению",
              color: Colors.white,
              size: 12,
            )));
  }
}
