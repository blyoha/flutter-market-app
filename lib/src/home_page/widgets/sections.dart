import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import 'section_item.dart';

class Sections extends StatelessWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.centerLeft,
        height: 150,
        child: GridView.count(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 0,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              sections.length,
              (index) => SectionItem(
                  image: sections.keys.toList()[index],
                  text: sections.values.toList()[index]),
            )));
  }
}
