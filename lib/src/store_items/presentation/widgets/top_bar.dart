import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../home_page/presentation/widgets/search_bar.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // back button
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
          color: AppColors.primaryColor,
          focusColor: AppColors.primaryColor.withOpacity(0.3),
        ),
        // search bar
        const Expanded(child: SearchBar()),
        // favourite button
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline_rounded),
          color: AppColors.primaryColor,
          focusColor: AppColors.primaryColor.withOpacity(0.3),
        ),
        // share button
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.ios_share_rounded),
          color: AppColors.primaryColor,
          focusColor: AppColors.primaryColor.withOpacity(0.3),
        ),
      ],
    );
  }
}