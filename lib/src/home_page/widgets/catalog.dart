import 'package:flutter/material.dart';

import '../../shopping_cart/models/store_item_model.dart';
import 'store_item.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: List.generate(StoreItemModel.storeItems.length,
            (index) => StoreItem(storeItem: StoreItemModel.storeItems[index])),
      ),
    );
  }
}
