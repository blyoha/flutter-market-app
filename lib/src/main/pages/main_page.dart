import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../favourite/pages/favourite_page.dart';
import '../../fresh/pages/fresh_page.dart';
import '../../home_page/pages/home_page.dart';
import '../../profile/pages/profile_page.dart';
import '../../shopping_cart/pages/cart_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPageIndex = 0;

  final pages = <Widget>[
    const HomePage(),
    const FreshPage(),
    const CartPage(),
    const FavouritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        iconSize: 25,
        currentIndex: selectedPageIndex,
        onTap: itemSelected,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Главная"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.circle_outlined,
              ),
              label: "Fresh"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              label: "Корзина"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
              ),
              label: "Избранное"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
              ),
              label: "Мой Ozon"),
        ],
      ),
      body: pages.elementAt(selectedPageIndex),
    );
  }

  void itemSelected(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
}
