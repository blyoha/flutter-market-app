import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../main/widgets/text.dart';
import '../../shopping_cart/controllers/cart_controller.dart';
import '../../shopping_cart/models/store_item_model.dart';
import '../../shopping_cart/pages/cart_page.dart';

class BottomBar extends StatefulWidget {
  // TODO: Fix activated button when go back.
  final CartController controller;
  final StoreItemModel storeItem;
  final int selectedPrice;

  const BottomBar(
      {Key? key,
      required this.controller,
      required this.storeItem,
      required this.selectedPrice})
      : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    bool isInCart = widget.controller.storeItems.containsKey(widget.storeItem);

    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: AppColors.primaryColor.withOpacity(0.3), width: 0.5)),
          color: AppColors.backgroundColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // price
          SimpleText(
            text: "${widget.selectedPrice} руб",
            color: AppColors.primaryColor,
            size: 18,
          ),
          const SizedBox(
            height: 5,
          ),
          // button
          SizedBox(
              height: 50,
              width: double.maxFinite,
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      backgroundColor: MaterialStateProperty.all<Color>(isInCart
                          ? AppColors.priceColor
                          : AppColors.focusColor)),
                  onPressed: () {
                    setState(() {
                      if (isInCart) {
                        Get.to(CartPage());
                      } else {
                        widget.controller.addStoreItem(widget.storeItem);
                      }
                    });
                  },
                  child: SimpleText(
                    text: isInCart ? "К корзине" : "В корзину",
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
