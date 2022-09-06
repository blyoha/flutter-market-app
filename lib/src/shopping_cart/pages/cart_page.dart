import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../home_page/widgets/pickup_point.dart';
import '../../main/widgets/text.dart';
import '../widgets/cart_total.dart';
import '../controllers/cart_controller.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatefulWidget {
  final CartController controller = Get.put(CartController());

  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
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
                  // select all
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        CheckAll(notifyParent: refresh),
                        const Expanded(
                            child: Text("Выбрать все",
                                style: TextStyle(fontSize: 13))),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                        content: const Text(
                                            "Вы точно хотите удалить выбранные товары? Отменить данное действие будет невозможно."),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text("Отмена")),
                                          TextButton(
                                              onPressed: () {
                                                widget.controller
                                                    .removeSelected();
                                                Get.back();
                                              },
                                              child:
                                                  const Text("Удалить товар"))
                                        ]));
                          },
                          child: Text(
                            "Удалить выбранные",
                            style: TextStyle(
                                color: AppColors.focusColor2, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                  CartItems(notifyParent: refresh),
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

  refresh() {
    setState(() {});
  }
}

class CartItems extends StatefulWidget {
  final Function() notifyParent;

  CartItems({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  final CartController controller = Get.put(CartController());

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
                  index: index,
                  notifyParent: widget.notifyParent)),
        ),
      );
    } else {
      return Container(
          margin: const EdgeInsets.only(top: 200),
          child: const Text(
            "Корзина пуста",
            style: TextStyle(fontSize: 20),
          ));
    }
  }
}

class CheckAll extends StatefulWidget {
  final Function notifyParent;

  const CheckAll({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<CheckAll> createState() => _CheckAllState();
}

class _CheckAllState extends State<CheckAll> {
  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(
        builder: (controller) => Checkbox(
            side: BorderSide(
                color: AppColors.primaryColor.withOpacity(0.1), width: 2),
            activeColor: AppColors.focusColor,
            splashRadius: 0,
            shape: const CircleBorder(),
            value: controller.allChecked,
            onChanged: (value) {
              controller.checkAll(value!);
              widget.notifyParent();
              setState(() {});
            }));
  }
}
