import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class Finance extends StatelessWidget {
  final IconData icon;
  final String title;
  final int value;
  final String currency;
  final String buttonText;

  const Finance({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.currency,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3)
      ], borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.primaryColor.withOpacity(0.05),
            child: Icon(
              icon,
              color: AppColors.focusColor,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: SizedBox(
              height: 40,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(color: AppColors.secondaryColor)),
                    Text("$value $currency",
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ]),
            ),
          ),
          SizedBox(
            height: 35,
            width: 100,
            child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.focusColor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 15))),
                onPressed: () {},
                child: Text(buttonText,
                    style: const TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}