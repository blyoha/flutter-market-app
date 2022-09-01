import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class HeaderList extends StatelessWidget {
  static final listItems = <List>[
    [
      "Избранное",
      [
        Icon(
          Icons.favorite_outline_rounded,
          color: AppColors.focusColor2,
        ),
        const Text("40")
      ]
    ],
    [
      "Рассрочка до",
      const [Text("300 000 руб")]
    ],
    [
      "Оформить подписку",
      const [Icon(Icons.workspace_premium_outlined), Text("Premium")]
    ],
    [
      "Баллы и бонусы",
      const [Icon(Icons.score_outlined), Text("0")]
    ]
  ];

  const HeaderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.separated(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: listItems.length,
            itemBuilder: (context, index) => HeaderListItem(
                title: listItems[index][0], content: listItems[index][1]),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 10)));
  }
}

class HeaderListItem extends StatelessWidget {
  final String title;
  final List<Widget> content;

  const HeaderListItem({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        // margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3)
        ], borderRadius: BorderRadius.circular(2), color: Colors.white),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(title), Row(children: content)]));
  }
}
