import 'dart:ffi';

import 'package:flutter/material.dart';

class StoreItem extends StatelessWidget {
  final String name;
  final Int price;
  final Int rating;
  final String image;

  const StoreItem(this.name, this.price, this.rating, this.image, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
