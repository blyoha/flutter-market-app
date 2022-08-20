import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../main/presentation/widgets/text.dart';

class BottomBar extends StatelessWidget {
  final int price;

  const BottomBar({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
                color: AppColors.primaryColor.withOpacity(0.3), width: 0.5)),
        color: AppColors.backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // price
          SimpleText(
            text: "$price руб",
            color: AppColors.primaryColor,
            size: 18,
          ),
          const SizedBox(
            height: 5,
          ),
          // button
          SizedBox(
              height: 50,
              width: double.maxFinite,
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.focusColor)),
                  onPressed: () {},
                  child: const SimpleText(
                    text: "В корзину",
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
