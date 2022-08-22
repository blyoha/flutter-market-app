import 'package:get/get.dart';

import '../../shopping_cart/models/store_item_model.dart';

class ShoppingCartController extends GetxController {
  // Dictionary to store the store items
  var storeItems = {}.obs;

  // Logic of adding a store item to the cart
  void addStoreItem(StoreItemModel storeItem) {
    if (storeItems.containsKey(storeItem)) {
      storeItems[storeItem]++;
    } else {
      storeItems[storeItem] = 1;
    }
  }

  // Logic of removing a store item from the cart
  void removeStoreItem(StoreItemModel storeItem) {}
}
