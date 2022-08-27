import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class PickupPoint extends StatelessWidget {
  final String location;

  const PickupPoint({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColors.secondaryColor, width: 1))),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: AppColors.focusColor,
          ),
          Text(
            "Пункт Ozon | $location",
            style: TextStyle(color: AppColors.focusColor, fontSize: 14),
          ),
          Expanded(child: Container()),
          Icon(Icons.arrow_forward_ios,
              size: 15, color: AppColors.secondaryColor),
        ],
      ),
    );
  }
}
