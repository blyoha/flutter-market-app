import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  final String text;
  final IconData icon;

  const SectionItem({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
        ),
        Text(textAlign: TextAlign.center, text)
      ],
    );
  }
}
