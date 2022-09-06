import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../home_page/pages/home_page.dart';
import '../../profile/pages/profile_page.dart';
import '../../shopping_cart/pages/cart_page.dart';
import '../widgets/cart_icon.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPageIndex = 0;

  final pages = <Widget>[
    const HomePage(),
    CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            color: AppColors.backgroundColor,
            height: 55,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPageIndex = 0;
                        });
                      },
                      child: selectedPageIndex == 0
                          ? Icon(Icons.home_outlined,
                              size: 30, color: AppColors.focusColor)
                          : Icon(Icons.home_outlined,
                              size: 30,
                              color: AppColors.primaryColor.withOpacity(0.7))),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPageIndex = 1;
                        });
                      },
                      child: CartIcon(selectedIndex: selectedPageIndex)),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPageIndex = 2;
                        });
                      },
                      child: selectedPageIndex == 2
                          ? Icon(Icons.person_outlined,
                              size: 30, color: AppColors.focusColor)
                          : Icon(Icons.person_outlined,
                              size: 30,
                              color: AppColors.primaryColor.withOpacity(0.7)))
                ])),
        body: pages.elementAt(selectedPageIndex));
  }

  void itemSelected(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
}
