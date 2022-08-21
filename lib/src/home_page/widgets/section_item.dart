import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../main/widgets/text.dart';

class SectionItem extends StatelessWidget {
  final String text;
  final String image;

  final double size = 40;

  const SectionItem({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: size,
          height: size,
        ),
        SimpleText(
          text: text,
          color: AppColors.primaryColor,
          size: 10,
          isCenter: true,
        )
      ],
    );
  }
}
