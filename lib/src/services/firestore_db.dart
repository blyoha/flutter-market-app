import 'package:cloud_firestore/cloud_firestore.dart';

import '../shopping_cart/models/store_item_model.dart';

class FirestoreDB {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<StoreItemModel>> getAllItems() {
    return firebaseFirestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => StoreItemModel.fromSnapshot(doc))
          .toList();
    });
  }
}
