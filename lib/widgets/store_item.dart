import 'package:flutter/material.dart';
import 'package:ozon_app/utils/app_colors.dart';
import 'package:ozon_app/widgets/text.dart';

class StoreItem extends StatelessWidget {
  final String name;
  final int price;
  final int rating;
  final String image;

  const StoreItem(this.name, this.price, this.rating, this.image, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.backgroundColor2),
            child: Image.asset(image, fit: BoxFit.fitHeight),
          ),
          // price
          Container(
              child: Header(
                  text: "$price RUB",
                  color: AppColors.secondaryColor,
                  size: 18)),
          // name
          SimpleText(text: name, color: AppColors.primaryColor),
          // cart button
          TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.focusColor),
                foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
                textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontWeight: FontWeight.bold)),
                padding: MaterialStateProperty.all(const EdgeInsets.all(10))
              ),
              onPressed: () {},
              child: const Text("В корзину"))
        ],
      ),
    );
  }
}
