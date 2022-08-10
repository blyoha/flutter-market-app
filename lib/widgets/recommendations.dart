import 'package:flutter/material.dart';
import 'package:ozon_app/utils/app_colors.dart';
import 'package:ozon_app/widgets/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Recommendations extends StatelessWidget {
  final pageController = PageController();
  final currentPageNotifier = ValueNotifier(0);
  final List<Color> content = [
    Colors.indigo,
    Colors.orange,
    Colors.purple,
    Colors.lightGreen,
  ];

  Recommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // page view
            SizedBox(
              height: 180,
              child: PageView.builder(
                  itemCount: content.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: content[index],
                        ),
                        margin: const EdgeInsets.all(15),
                        child: Center(
                            child: Header(
                          text: "RECOMMENDATION ${index + 1}",
                          color: AppColors.primaryColor,
                          size: 30,
                        )));
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
                        count: content.length,
                        effect: ScrollingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: AppColors.focusColor,
                            dotColor: AppColors.secondaryColor))))
          ],
        )
      ],
    );
  }
}
