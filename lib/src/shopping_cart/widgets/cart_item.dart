import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../controllers/cart_controller.dart';
import '../models/store_item_model.dart';

class CartItem extends StatefulWidget {
  final CartController controller;
  final StoreItemModel storeItem;
  final int quantity;
  final int index;

  final Function notifyParent;

  const CartItem(
      {Key? key,
      required this.controller,
      required this.storeItem,
      required this.quantity,
      required this.index,
      required this.notifyParent})
      : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final int installment = (widget.storeItem.price *
            widget.controller.storeItems[widget.storeItem] /
            6)
        .ceil();

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
                Row(children: [
                  Checkbox(
                      side: BorderSide(
                          color: AppColors.primaryColor.withOpacity(0.1),
                          width: 2),
                      activeColor: AppColors.focusColor,
                      splashRadius: 0,
                      shape: const CircleBorder(),
                      value: widget.storeItem.isChecked,
                      onChanged: (value) {
                        widget.notifyParent();
                        setState(() {
                          widget.storeItem.isChecked = value!;
                        });
                      }),
                  Image.network(widget.storeItem.images[0],
                      height: 80, width: 80, fit: BoxFit.fitHeight,
                      errorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/images/network_error.png",
                        height: 80, width: 80, fit: BoxFit.fitHeight);
                  })
                ]),
                // item info
                Container(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // price
                          Text(
                              "${widget.controller.subTotalPrice[widget.index]} руб",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          // name
                          SizedBox(
                              width: 200,
                              child: Text(
                                widget.storeItem.name,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ))
                        ]))
              ]),
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
                      child: Text("Частями по $installment / мес",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold))))),
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
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                  content: const Text(
                                      "Вы точно хотите удалить товар? Отменить данное действие будет невозможно."),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("Отмена")),
                                    TextButton(
                                        onPressed: () {
                                          widget.controller.removeStoreItem(
                                              widget.storeItem);
                                          Get.back();
                                        },
                                        child: const Text("Удалить товар"))
                                  ]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Icon(Icons.delete_outline_rounded,
                                color: AppColors.primaryColor, size: 20)),
                        const Text("Удалить")
                        // SimpleText(text: "Удалить", color: AppColors.primaryColor)
                      ]),
                    ),
                  ),
                ),
                // quantity
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => AmountSelection(
                            controller: widget.controller,
                            storeItem: widget.storeItem,
                            quantity: widget.quantity - 1));
                  },
                  child: Row(
                    children: [
                      Text("${widget.quantity} шт."),
                      Column(children: const [
                        Icon(Icons.keyboard_arrow_up_rounded, size: 20),
                        Icon(Icons.keyboard_arrow_down_rounded, size: 20)
                      ])
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AmountSelection extends StatelessWidget {
  final CartController controller;
  final StoreItemModel storeItem;
  final int? quantity;

  const AmountSelection(
      {Key? key,
      required this.controller,
      required this.storeItem,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Expanded(
                  child: Text(
                "Выберите количество",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Закрыть"))
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              10,
              (index) => GestureDetector(
                    onTap: () {
                      controller.storeItems[storeItem] = index + 1;
                      Get.back();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 20),
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, right: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.primaryColor
                                      .withOpacity(0.1)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${index + 1}"),
                          if (index == quantity)
                            Icon(
                              Icons.check,
                              color: AppColors.focusColor,
                              size: 18,
                            )
                        ],
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
