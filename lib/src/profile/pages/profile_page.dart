import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../home_page/widgets/search_bar.dart';
import '../widgets/finance.dart';
import '../widgets/header_list_item.dart';
import '../widgets/options_list.dart';

class ProfilePage extends StatelessWidget {
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
                        const HeaderList()
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
                            value: 250,
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
                  const OptionsList()
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
