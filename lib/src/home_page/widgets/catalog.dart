import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/store_item_controller.dart';
import 'store_item.dart';

class Catalog extends StatelessWidget {
  final controller = Get.put(StoreItemController());

  Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(left: 5),
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: List.generate(controller.storeItems.length,
              (index) => StoreItem(storeItem: controller.storeItems[index])),
        ),
      ),
    );
  }
}
