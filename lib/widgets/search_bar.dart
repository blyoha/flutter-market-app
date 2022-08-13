import 'package:flutter/material.dart';
import 'package:ozon_app/utils/app_colors.dart';

class SearchBar extends StatelessWidget {
  final double barHeight = 35;

  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
            height: barHeight,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: Colors.white,
            ),
            child: TextField(
                decoration: InputDecoration(
                    iconColor: AppColors.searchBarColor,
                    hintText: "Искать на Ozon",
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none))),
      ),
      // qr icon
      Container(
        height: barHeight,
        width: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          color: Colors.white,
        ),
        child: SizedBox(
          child: Icon(Icons.qr_code_2, color: AppColors.primaryColor),
        ),
      ),
    ]);
  }
}
