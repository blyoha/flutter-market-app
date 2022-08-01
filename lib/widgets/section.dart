import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String text;
  final IconData icon;

  const Section({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [Icon(icon, size: 30,), Text(text)],
      ),
    );
  }
}
