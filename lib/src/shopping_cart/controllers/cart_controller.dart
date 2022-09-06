import 'package:get/get.dart';

import '../../shopping_cart/models/store_item_model.dart';

class CartController extends GetxController {
  // Dictionary to store the store items
  final _storeItems = {}.obs;

  // Logic of adding a store item to the cart
  void addStoreItem(StoreItemModel storeItem) {
    if (_storeItems.containsKey(storeItem)) {
      _storeItems[storeItem]++;
    } else {
      _storeItems[storeItem] = 1;
    }
  }

  // Logic of decreasing a store item from the cart
  void decreaseStoreItem(StoreItemModel storeItem) {
    if (_storeItems.containsKey(storeItem) && storeItems[storeItem] == 1) {
      storeItems.removeWhere((key, value) => key == storeItem);
    } else {
      storeItems[storeItem]--;
    }
  }

  // Logic of removing a store item from the cart
  void removeStoreItem(StoreItemModel storeItem) {
    storeItems.removeWhere((key, value) => key == storeItem);
  }

  // Getting all items in the cart.
  get storeItems => _storeItems;

  // Getting total price for one item.
  get subTotalPrice => _storeItems.entries
      .map((storeItem) => storeItem.key.price * storeItem.value)
      .toList();

  // Getting total price for all items.
  get totalPrice {
    if (_storeItems.isEmpty) {
      return 0;
    }
    return subTotalPrice.reduce((value, element) => value + element);
  }

  // Getting amount of all items.
  get totalItems {
    if (_storeItems.isEmpty) {
      return 0;
    }
    return _storeItems.values.reduce((value, element) => value + element);
  }

  get allChecked => _storeItems.keys.toList().every((item) => item.isChecked);

  void checkAll(bool value) {
    _storeItems.forEach((k, v) {
      k.isChecked = value;
    });
  }

  void removeSelected() {
    for (var item in _storeItems.keys.toList()) {
      if (item.isChecked) {
        removeStoreItem(item);
      }
    }
  }
}
