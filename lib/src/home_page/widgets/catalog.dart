import 'package:flutter/material.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: List.generate(6, (index) {
          return const StoreItem(
              "Рюкзак Mr. Skinner Летнее настроение",
              1475,
              5,
              15,
              "assets/images/gas.webp",
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              "Some specs Some specs Some specs Some specs");
        }),
      ),
    );
  }
}
