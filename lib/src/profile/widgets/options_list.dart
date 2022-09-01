import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class OptionsList extends StatelessWidget {
  static final options = {
    "title": "ПОКУПКИ",
    "options": [
      "Что в коробке?",
      "Заказы",
      "Возвраты",
      "Избранное",
      "Купленные товары",
      "Сравнение товаров",
      "Ozon Travel",
      "Цифровые товары",
      "Электронные чеки"
    ]
  };

  const OptionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(options["title"] as String,
            style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.bold)),
      ),
      Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (options["options"] as List<String>).length,
            itemBuilder: (context, index) => SizedBox(
                height: 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child:
                            Text((options["options"] as List<String>)[index])),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.arrow_forward_ios,
                          size: 15, color: AppColors.primaryColor),
                    )
                  ],
                )),
            separatorBuilder: (context, index) =>
                const Divider(thickness: 0.8)),
      )
    ]);
  }
}
