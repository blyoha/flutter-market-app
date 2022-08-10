import 'package:flutter/material.dart';
import 'package:ozon_app/utils/app_colors.dart';
import 'package:ozon_app/widgets/recommendations.dart';
import 'package:ozon_app/widgets/search_bar.dart';
import 'package:ozon_app/widgets/sections.dart';
import 'package:ozon_app/widgets/store_item.dart';
import 'package:ozon_app/widgets/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pickupPoint = "ул. Бабушкина, 223";

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // top search
            Positioned(
                top: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  color: AppColors.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      // flight icon
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.flight, color: Colors.white),
                      ),
                      // search bar
                      Expanded(
                        child: SearchBar(),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            Icon(Icons.notifications_none, color: Colors.white),
                      )
                    ],
                  ),
                )),
            // main content
            Container(
                padding: const EdgeInsets.only(top: 50),
                height: double.maxFinite,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        // pickup point
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.secondaryColor,
                                      width: 1))),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: AppColors.primaryColor),
                              SimpleText(
                                  text: "Пункт Ozon | $pickupPoint",
                                  color: AppColors.primaryColor),
                              Expanded(child: Container()),
                              Icon(Icons.arrow_forward_ios,
                                  color: AppColors.primaryColor),
                            ],
                          ),
                        ),
                        // recommendation cards
                        Recommendations(),
                        // sections
                        const Sections(),
                        const SizedBox(height: 10),
                        // offers
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: List.generate(6, (index) {
                              return const StoreItem(
                                  "Рюкзак Mr. Skinner Летнее настроение",
                                  1475,
                                  5,
                                  "assets/images/backpack.webp");
                            }),
                          ),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
