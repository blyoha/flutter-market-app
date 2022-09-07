import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../home_page/controllers/store_item_controller.dart';
import '../../shopping_cart/models/store_item_model.dart';

class ItemTypes extends StatefulWidget {
  final Map<String, dynamic> typeList;
  final StoreItemModel storeItem;
  final dynamic typeSelected;

  const ItemTypes(
      {Key? key,
      required this.typeList,
      required this.storeItem,
      required this.typeSelected})
      : super(key: key);

  @override
  State<ItemTypes> createState() => _ItemTypesState();
}

class _ItemTypesState extends State<ItemTypes> {
  final StoreItemController controller = Get.find();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.typeList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color: selectedIndex == index
                            ? AppColors.focusColor
                            : AppColors.primaryColor.withOpacity(0.1))),
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(widget.typeList.keys.toList()[index],
                    style: TextStyle(color: AppColors.primaryColor))),
            onTap: () {
              setState(() {
                selectedIndex = index;
                widget.typeSelected(selectedIndex);
              });
            },
          );
        },
      ),
    );
  }
}
