import 'package:flutter/material.dart';
import 'package:ozon_app/utils/app_colors.dart';
import 'package:ozon_app/widgets/text.dart';

class StoreItem extends StatelessWidget {
  final String name;
  final int price;
  final int rating;
  final String image;

  final double width = 100;

  const StoreItem(this.name, this.price, this.rating, this.image, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
              margin: const EdgeInsets.only(bottom: 5),
              width: width,
              height: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.backgroundColor,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fitHeight))),
          // price
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
            decoration: BoxDecoration(color: AppColors.priceColor),
            child: Header(text: "$price руб", color: Colors.white, size: 15),
          ),
          // name
          Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: SimpleText(text: name, color: AppColors.primaryColor)),
          // cart button
          SizedBox(
            height: 32,
            width: double.maxFinite,
            child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.focusColor2),
                  // padding: MaterialStateProperty.all(const EdgeInsets.all(5))
                ),
                onPressed: () {},
                child: const Header(
                  text: "В корзину",
                  color: Colors.white,
                  size: 12,
                )),
          )
        ],
      ),
    );
  }
}
