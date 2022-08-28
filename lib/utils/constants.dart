import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(25, 33, 38, 1);
  static Color secondaryColor = const Color.fromRGBO(112, 127, 141, 1);
  static Color backgroundColor = const Color.fromRGBO(242, 245, 249, 1);

  static Color focusColor = const Color.fromRGBO(0, 91, 255, 1);
  static Color focusColor2 = const Color.fromRGBO(249, 17, 85, 1);
  static Color priceColor = const Color.fromRGBO(16, 196, 76, 1);
  static Color starColor = const Color.fromRGBO(255, 184, 0, 1);

  static Color searchBarColor = const Color.fromRGBO(140, 144, 147, 1);
}

List<String> recommendationsUrl = <String>[
  "https://cdn1.ozone.ru/s3/cms/12/tdb/wc450/456x150x2-premium_net.jpg",
  "https://cdn1.ozone.ru/s3/cms/31/tb4/wc450/456x150x2_rassrochka.jpg",
  "https://cdn1.ozone.ru/s3/cms/f0/tee/wc450/456x150x2-3.jpg",
  "https://cdn1.ozone.ru/s3/cms/ba/tfc/wc450/3_-_klimat_desk.jpg"
];

Map<String, String> sections = {
  "brands.png": "Бренды",
  "business.png": "Бизнесс",
  "cosmetics.png": "Красота и здоровье",
  "electronics.png": "Электроника",
  "fashion.png": "Одежра и обувь",
  "house.png": "Для дома",
  "premium.png": "Premium",
  "sales.png": "Акции",
  "travel.png": "Путешествия",
};
