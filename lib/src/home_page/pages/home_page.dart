import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../widgets/catalog.dart';
import '../widgets/pickup_point.dart';
import '../widgets/recommendations.dart';
import '../widgets/search_bar.dart';
import '../widgets/sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String pickupPoint = "ул. Бабушкина, 223";

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
                        const PickupPoint(location: pickupPoint),
                        // recommendation cards
                        Recommendations(),
                        // sections
                        const Sections(),
                        const SizedBox(height: 10),
                        // offers
                        const Catalog()
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
