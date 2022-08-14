import 'package:flutter/material.dart';
import 'package:ozon_app/utils/app_colors.dart';
import 'package:ozon_app/widgets/search_bar.dart';
import 'package:ozon_app/widgets/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StoreItemDetails extends StatelessWidget {
  final String itemName;
  final int price;
  final double rating;
  final int reviewsCount;

  final List images = ["assets/images/gas.webp", "assets/images/gas.webp"];

  StoreItemDetails(
      {Key? key,
      required this.itemName,
      required this.price,
      required this.rating,
      required this.reviewsCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const TopBar())),
            // main content
            Container(
              padding: const EdgeInsets.only(top: 50),
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // images
                    ImagesScroll(
                      images: images,
                    ),
                    const SizedBox(height: 15),
                    // rating, reviews
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.backgroundColor,
                          boxShadow: const [
                            BoxShadow(color: Colors.black38, blurRadius: 8)
                          ]),
                      width: 140,
                      height: 55,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Wrap(
                                    children: List.generate(5, (index) {
                                      if (index < rating) {
                                        return Icon(Icons.star_rounded,
                                            color: AppColors.starColor);
                                      } else {
                                        return Icon(Icons.star_rounded,
                                            color: AppColors.primaryColor
                                                .withOpacity(0.3));
                                      }
                                    }),
                                  )
                                ],
                              ),
                              SimpleText(
                                text: "$reviewsCount отзывов",
                                color: AppColors.focusColor,
                                size: 14,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                    // price
                    // name
                    // colors
                    // recommendations
                    // description
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // back button
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
          color: AppColors.primaryColor,
          focusColor: AppColors.primaryColor.withOpacity(0.3),
        ),
        // search bar
        const Expanded(child: SearchBar()),
        // favourite button
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline_rounded),
          color: AppColors.primaryColor,
          focusColor: AppColors.primaryColor.withOpacity(0.3),
        ),
        // share button
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.ios_share_rounded),
          color: AppColors.primaryColor,
          focusColor: AppColors.primaryColor.withOpacity(0.3),
        ),
      ],
    );
  }
}

class ImagesScroll extends StatelessWidget {
  final List images;

  final PageController pageController = PageController();

  ImagesScroll({Key? key, required this.images}) : super(key: key);

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
              return Image(
                image: AssetImage(images[index]),
                fit: BoxFit.fitHeight,
              );
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
