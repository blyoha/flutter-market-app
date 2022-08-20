import 'package:flutter/material.dart';
import 'package:ozon_app/src/shopping_cart/presentation/pages/cart_screen.dart';
import 'package:ozon_app/src/fresh/presentation/pages/fresh_screen.dart';
import 'package:ozon_app/src/profile/presentation/pages/profile_screen.dart';
import 'package:ozon_app/utils/app_colors.dart';

import '../../../favourite/presentation/pages/favourite_screen.dart';
import '../../../home_page/presentation/pages/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPageIndex = 0;

  final pages = <Widget>[
    const HomeScreen(),
    const FreshScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
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
