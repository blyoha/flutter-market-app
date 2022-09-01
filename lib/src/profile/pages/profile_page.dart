import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../home_page/widgets/search_bar.dart';

class ProfilePage extends StatelessWidget {
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

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(children: [
          Positioned(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  color: AppColors.focusColor,
                  child: const SearchBar())),
          Container(
            padding: const EdgeInsets.only(top: 50),
            height: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header
                  Stack(children: [
                    Positioned(
                        child: Container(
                            height: 210, color: AppColors.focusColor)),
                    Positioned(
                        top: 210,
                        child: Container(
                            height: 100, color: AppColors.backgroundColor)),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30, top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white.withOpacity(0.8),
                              child: const SizedBox(
                                height: 30,
                                child: Text("НР",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30)),
                              ),
                              // radius: 50
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Николай Радович",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white)),
                                  Text("Управление аккаунтом",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white))
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                size: 15, color: Colors.white)
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: const [
                            Icon(Icons.business_center_outlined,
                                color: Colors.white),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text("Покупайте как юрлицо",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 15, color: Colors.white)
                          ],
                        ),
                        const Divider(color: Colors.white),
                        Row(
                          children: const [
                            Icon(Icons.person_outline_outlined,
                                color: Colors.white),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text("Моя страница",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 15, color: Colors.white)
                          ],
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                            height: 80,
                            child: ListView.separated(
                                clipBehavior: Clip.none,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: listItems.length,
                                itemBuilder: (context, index) => HeaderListItem(
                                    title: listItems[index][0],
                                    content: listItems[index][1]),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(width: 10)))
                      ]),
                    ),
                  ]),
                  // finances
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text("МОИ ФИНАНСЫ",
                        style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Finance(
                            icon: Icons.currency_ruble_outlined,
                            title: "Ozon карта",
                            value: 0,
                            currency: "руб",
                            buttonText: "Пополнить"),
                        SizedBox(height: 10),
                        Finance(
                            icon: Icons.workspace_premium_outlined,
                            title: "Premium баллы",
                            value: 0,
                            currency: "Б",
                            buttonText: "Накопить")
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  OptionsList(
                      title: options["title"] as String,
                      options: options["options"] as List<String>)
                ],
              ),
            ),
          ),
        ]),
      ),
    );
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

class Finance extends StatelessWidget {
  final IconData icon;
  final String title;
  final int value;
  final String currency;
  final String buttonText;

  const Finance({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.currency,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3)
      ], borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.primaryColor.withOpacity(0.05),
            child: Icon(
              Icons.currency_ruble_outlined,
              color: AppColors.focusColor,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: SizedBox(
              height: 40,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(color: AppColors.secondaryColor)),
                    Text("$value $currency",
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ]),
            ),
          ),
          SizedBox(
            height: 35,
            width: 100,
            child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.focusColor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 15))),
                onPressed: () {},
                child: Text(buttonText,
                    style: const TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}

class OptionsList extends StatelessWidget {
  final String title;
  final List<String> options;

  const OptionsList({Key? key, required this.title, required this.options})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(title,
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
            itemCount: options.length,
            itemBuilder: (context, index) => SizedBox(
                height: 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Text(options[index])),
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
