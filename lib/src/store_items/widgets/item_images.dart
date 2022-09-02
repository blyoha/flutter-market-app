import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants.dart';

class ItemImages extends StatelessWidget {
  final List images;

  final PageController pageController = PageController();

  ItemImages({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            children: List.generate(images.length, (index) {
              return Image.network(images[index], fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) {
                return Padding(
                    padding: const EdgeInsets.all(100),
                    child: Image.asset("assets/images/network_error.png"));
              });
            }),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: images.length,
          effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 5,
              expansionFactor: 2,
              dotColor: AppColors.primaryColor.withOpacity(0.3),
              activeDotColor: AppColors.primaryColor),
        )
      ],
    );
  }
}
