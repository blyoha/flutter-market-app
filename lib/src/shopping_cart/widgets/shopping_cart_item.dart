import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../main/widgets/text.dart';
import '../controllers/shopping_cart_controller.dart';
import '../models/store_item_model.dart';

class ShoppingCartItem extends StatefulWidget {
  final ShoppingCartController controller;
  final StoreItemModel storeItem;
  final int quantity;
  final int index;

  const ShoppingCartItem(
      {Key? key,
      required this.controller,
      required this.storeItem,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // checkbox + image
              Row(
                children: [
                  Checkbox(
                      side: BorderSide(
                          color: AppColors.primaryColor.withOpacity(0.1),
                          width: 2),
                      activeColor: AppColors.focusColor,
                      shape: const CircleBorder(),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      }),
                  Image.asset(
                    widget.storeItem.images[0],
                    width: 80,
                    height: 80,
                  )
                ],
              ),
              // item info
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // price
                    Header(
                        text: "${widget.storeItem.price} руб",
                        color: AppColors.primaryColor, size: 15,),
                    const SizedBox(height: 5),
                    // name
                    SizedBox(
                      width: 210,
                      child: Flexible(
                        child: Text(
                          widget.storeItem.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          // installment
          FittedBox(
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(254, 204, 50, 1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SimpleText(
                    text:
                        "Частями по ${(widget.storeItem.price / 6).ceil()} / мес",
                    color: AppColors.primaryColor,
                    size: 12),
              ),
            ),
          ),
          Divider(
              thickness: 1, color: AppColors.secondaryColor.withOpacity(0.3)),
          // buttons bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                // to favourite
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                  ),
                  const Text("В избранное")
                ]),
                // remove
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.delete_outline_rounded,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                      ),
                      const Text("Удалить")
                      // SimpleText(text: "Удалить", color: AppColors.primaryColor)
                    ]),
                  ),
                ),
                // quantity
                Row(
                  children: [
                    Text("? шт."),
                    Column(
                      children: const [
                        Icon(Icons.keyboard_arrow_up_rounded),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
