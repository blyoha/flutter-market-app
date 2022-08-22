import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shopping_cart/models/store_item_model.dart';

class ShoppingCartController extends GetxController {
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

  // Logic of removing a store item from the cart
  void removeStoreItem(StoreItemModel storeItem) {
    Get.snackbar("Removed from cart", "You've removed the ${storeItem.name}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.only(bottom: 30));
  }

  // Getting all items in the cart.
  get storeItems => _storeItems;

  // Get item quantity.
  int getQuantity(StoreItemModel storeItem) {
    return _storeItems[storeItem];
  }
}
