import 'package:flutter/material.dart';

import 'section_item.dart';

class Sections extends StatelessWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemCount = 12;

    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.centerLeft,
        height: 150,
        child: GridView.count(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            scrollDirection: Axis.horizontal,
            mainAxisSpacing: 20,
            children: List.generate(
              itemCount,
              (index) =>
                  const SectionItem(icon: Icons.menu_outlined, text: "Каталог"),
            )));
  }
}
