import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../main/presentation/widgets/text.dart';

class ItemInfo extends StatefulWidget {
  final String description;
  final String specs;

  const ItemInfo({Key? key, required this.description, required this.specs})
      : super(key: key);

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
              child: Header(
                  text: "ОПИСАНИЕ", color: AppColors.primaryColor, size: 13),
            ),
            Tab(
              child: Header(
                  text: "ХАРАКТЕРИСТИКИ",
                  color: AppColors.primaryColor,
                  size: 13),
            )
          ],
        ),
        // content
        SizedBox(
          height: 200,
          child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                // description
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SimpleText(
                      text: widget.description, color: AppColors.primaryColor),
                ),
                // specs
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SimpleText(
                      text: widget.specs, color: AppColors.primaryColor),
                )
              ]),
        )
      ],
    );
  }
}
