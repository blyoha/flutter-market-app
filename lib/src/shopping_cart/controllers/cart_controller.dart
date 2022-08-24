import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shopping_cart/models/store_item_model.dart';

class CartController extends GetxController {
  // TODO: Fix dat fucking zero items bug!!

  // Dictionary to store the store items
  final _storeItems = {}.obs;

  // Logic of adding a store item to the cart
  void addStoreItem(StoreItemModel storeItem) {
    if (_storeItems.containsKey(storeItem)) {
      _storeItems[storeItem]++;
    } else {
      _storeItems[storeItem] = 1;
    }

    Get.snackbar("Added to cart", "You've added the ${storeItem.name}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.only(bottom: 30));
  }

  // Logic of decreasing a store item from the cart
  void decreaseStoreItem(StoreItemModel storeItem) {
    if (_storeItems.containsKey(storeItem) && storeItems[storeItem] == 1) {
      storeItems.removeWhere((key, value) => key == storeItem);
    } else {
      storeItems[storeItem]--;
    }

    Get.snackbar("Removed from cart", "You've removed the ${storeItem.name}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.only(bottom: 30));
  }

  // Getting all items in the cart.
  get storeItems => _storeItems;

  // Getting total price for one item.
  get subTotalPrice => _storeItems.entries
      .map((storeItem) => storeItem.key.price * storeItem.value)
      .toList();

  // Getting total price for all items.
  get totalPrice => subTotalPrice.reduce((value, element) => value + element);

  // Getting amount of all items.
  get totalItems =>
      _storeItems.values.reduce((value, element) => value + element);
}
