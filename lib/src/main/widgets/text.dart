import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const Header(
      {Key? key, required this.text, this.size = 18, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class SimpleText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final bool isCenter;

  const SimpleText(
      {Key? key,
      required this.text,
      required this.color,
      this.size = 16,
      this.isCenter = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
    );
  }
}
