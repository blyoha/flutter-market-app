import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../shopping_cart/models/store_item_model.dart';

class ItemInfo extends StatefulWidget {
  final StoreItemModel storeItem;

  const ItemInfo({Key? key, required this.storeItem}) : super(key: key);

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // tabs
        TabBar(
            indicatorColor: AppColors.focusColor,
            indicatorSize: TabBarIndicatorSize.label,
            controller: tabController,
            tabs: [
              Tab(
                  child: Text("ОПИСАНИЕ",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold))),
              Tab(
                  child: Text("ХАРАКТЕРИСТИКИ",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold)))
            ]),
        // content
        SizedBox(
          height: 300,
          child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                // description
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(widget.storeItem.description,
                      overflow: TextOverflow.ellipsis, maxLines: 12),
                ),
                // specs
                Specs(
                  storeItem: widget.storeItem,
                )
              ]),
        )
      ],
    );
  }
}

class Specs extends StatelessWidget {
  final StoreItemModel storeItem;

  const Specs({Key? key, required this.storeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
            children: List.generate(
                storeItem.specs.length,
                (index) => Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(children: [
                      Text(storeItem.specs.keys.toList()[index]),
                      Expanded(
                          child: Text("." * 100,
                              style: TextStyle(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.3)),
                              maxLines: 1)),
                      Text(storeItem.specs.values.toList()[index],
                          style: TextStyle(color: AppColors.primaryColor))
                    ])))));
  }
}
