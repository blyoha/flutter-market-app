import 'package:flutter/material.dart';
import 'package:ozon_app/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Recommendations extends StatelessWidget {
  final pageController = PageController();
  final currentPageNotifier = ValueNotifier(0);
  final int recommendationCount = 4;

  Recommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // page view
            SizedBox(
              height: 170,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: recommendationCount,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/recommendations/recommendation${index + 1}.webp"),
                              fit: BoxFit.fitHeight),
                        ),
                        margin: const EdgeInsets.all(15));
                  }),
            ),
            // dot indicators
            Positioned(
                left: 0,
                right: 0,
                bottom: 30,
                child: Center(
                    child: SmoothPageIndicator(
                        controller: pageController,
                        count: recommendationCount,
                        effect: ScrollingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: AppColors.backgroundColor,
                            dotColor:
                                AppColors.backgroundColor.withOpacity(0.3)))))
          ],
        )
      ],
    );
  }
}
