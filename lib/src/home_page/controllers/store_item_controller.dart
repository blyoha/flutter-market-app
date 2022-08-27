import 'package:get/get.dart';

import '../../services/firestore_db.dart';
import '../../shopping_cart/models/store_item_model.dart';

class StoreItemController extends GetxController {
  final storeItems = <StoreItemModel>[].obs;

  @override
  void onInit() {
    storeItems.bindStream(FirestoreDB().getAllItems());
    super.onInit();
  }
}
