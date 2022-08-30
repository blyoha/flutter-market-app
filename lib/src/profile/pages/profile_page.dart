import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../home_page/widgets/search_bar.dart';

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
                      // color: AppColors.focusColor,
                      child: Column(children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                              // radius: 50
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Николай Радович",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                Text("Управление аккаунтом",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward_ios,
                                    size: 15, color: Colors.white))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.business_center_outlined,
                                color: Colors.white),
                            Text("Покупайте как юрлицо"),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios,
                                    size: 15, color: Colors.white))
                          ],
                        ),
                        Divider(color: Colors.white),
                        Row(
                          children: [
                            Icon(Icons.business_center_outlined,
                                color: Colors.white),
                            Text("Покупайте как юрлицо"),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios,
                                    size: 15, color: Colors.white))
                          ],
                        ),
                        Container(
                            height: 80,
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                  4,
                                  (index) => HeaderListItem(
                                        title: "Избранное",
                                        content: [
                                          Icon(Icons.favorite_outline_rounded),
                                          Text("40")
                                        ],
                                      )),
                            ))
                      ]),
                    ),
                  ]),
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
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Row(
              children: content,
            )
          ],
        ));
  }
}