import 'package:flutter/material.dart';
import 'package:ozon_app/utils/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: TextField(
                  decoration: InputDecoration(iconColor: AppColors.searchBarColor,
                      hintText: "Search", prefixIcon: const Icon(Icons.search), border: InputBorder.none))),
        ),
        VerticalDivider(color: AppColors.primaryColor, width: 1),
        // qr icon
        Container(
          height: 40,
          width: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.qr_code_2, color: AppColors.primaryColor),
          ),
        ),
      ]
    );
  }
}
