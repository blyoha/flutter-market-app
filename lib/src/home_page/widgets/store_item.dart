import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../shopping_cart/controllers/cart_controller.dart';
import '../../shopping_cart/models/store_item_model.dart';
import '../../store_items/pages/store_item_page.dart';

class StoreItem extends StatefulWidget {
  final StoreItemModel storeItem;

  const StoreItem({Key? key, required this.storeItem}) : super(key: key);

  @override
  State<StoreItem> createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  final CartController controller = Get.put(CartController());
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
                      image: NetworkImage(widget.storeItem.images[0]),
                      fit: BoxFit.fitHeight)),
              child: Center(
                  child: Image.network(
                widget.storeItem.images[0],
                fit: BoxFit.fitHeight,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/network_error.png");
                },
              )),
            ),
            // price
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              decoration: BoxDecoration(color: AppColors.priceColor),
              child: Text("${widget.storeItem.price} руб",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
            // name
            Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(widget.storeItem.name,
                    style: TextStyle(
                        color: AppColors.primaryColor, fontSize: 14))),
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
                      child: const Text("В корзину",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold))))
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
                  Text("$itemsInCart шт",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
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
      controller.addStoreItem(widget.storeItem);
    });
  }

  void onRemovePressed() {
    setState(() {
      if (itemsInCart > 0) {
        itemsInCart--;
        controller.decreaseStoreItem(widget.storeItem);
      }
    });
  }
}
