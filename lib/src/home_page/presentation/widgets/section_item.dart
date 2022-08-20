import 'package:flutter/material.dart';
import 'package:ozon_app/utils/app_colors.dart';
import 'package:ozon_app/src/main/presentation/widgets/text.dart';

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
