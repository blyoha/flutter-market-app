import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../main/widgets/text.dart';
import '../../shopping_cart/controllers/shopping_cart_controller.dart';
import '../../shopping_cart/models/store_item_model.dart';
import '../../store_items/pages/store_item_page.dart';

class StoreItem extends StatefulWidget {
  final StoreItemModel storeItem;

  const StoreItem({Key? key, required this.storeItem}) : super(key: key);

  @override
  State<StoreItem> createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());
  int itemsInCart = 0;
  final double width = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
      width: width,
      child: GestureDetector(
        onTap: () => Get.to(() => StoreItemPage(storeItem: widget.storeItem)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                width: width,
                height: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.backgroundColor,
                    image: DecorationImage(
                        image: AssetImage(widget.storeItem.images[0]),
                        fit: BoxFit.fitHeight))),
            // price
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              decoration: BoxDecoration(color: AppColors.priceColor),
              child: Header(
                  text: "${widget.storeItem.price} руб",
                  color: Colors.white,
                  size: 15),
            ),
            // name
            Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: SimpleText(
                  text: widget.storeItem.name,
                  color: AppColors.primaryColor,
                  size: 14,
                )),
            // cart button
            if (itemsInCart == 0)
              SizedBox(
                  height: 32,
                  width: double.maxFinite,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.focusColor2)),
                      onPressed: () {
                        onAddPressed();
                      },
                      child: const Header(
                        text: "В корзину",
                        color: Colors.white,
                        size: 12,
                      )))
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black.withOpacity(0.05)),
                      child: GestureDetector(
                          onTap: () {
                            onRemovePressed();
                          },
                          child: Icon(
                            Icons.remove_rounded,
                            color: AppColors.focusColor.withOpacity(0.7),
                          ))),
                  SimpleText(
                    text: "$itemsInCart шт",
                    color: AppColors.primaryColor,
                    size: 10,
                  ),
                  Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black.withOpacity(0.05)),
                      child: GestureDetector(
                          onTap: () {
                            onAddPressed();
                          },
                          child: Icon(
                            Icons.add_rounded,
                            color: AppColors.focusColor.withOpacity(0.7),
                          ))),
                ],
              )
          ],
        ),
      ),
    );
  }

  void onAddPressed() {
    setState(() {
      itemsInCart++;
      shoppingCartController.addStoreItem(widget.storeItem);
    });
  }

  void onRemovePressed() {
    setState(() {
      if (itemsInCart > 0) {
        itemsInCart--;
        shoppingCartController.removeStoreItem(widget.storeItem);
      }
    });
  }
}
