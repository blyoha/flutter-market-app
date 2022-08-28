import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class SectionItem extends StatelessWidget {
  final String text;
  final String image;

  final double size = 35;

  const SectionItem({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/sections/$image",
          width: size,
          height: size,
        ),
        const SizedBox(height: 5),
        Text(text,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 10,
            ),
            textAlign: TextAlign.center)
      ],
    );
  }
}
