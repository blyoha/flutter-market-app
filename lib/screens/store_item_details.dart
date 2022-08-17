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
  final String description;
  final String specs;

  final List images = ["assets/images/gas.webp", "assets/images/gas.webp"];

  StoreItemDetails(
      {Key? key,
      required this.itemName,
      required this.price,
      required this.rating,
      required this.reviewsCount,
      required this.description,
      required this.specs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int installment = (price / 6).ceil();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // top bar
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
                    ),
                    const SizedBox(height: 20),
                    // price
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // price
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Header(
                                      text: "$price руб",
                                      color: AppColors.primaryColor,
                                      size: 22,
                                    ),
                                  ),
                                  Row(children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 3),
                                      color: const Color.fromRGBO(
                                          255, 225, 120, 1),
                                      child: SimpleText(
                                        text: "$installment руб",
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    SimpleText(
                                      text: " \u00d7 6 мес",
                                      color: AppColors.secondaryColor,
                                      size: 14,
                                    ),
                                  ]),
                                ],
                              ),
                              Expanded(child: Container()),
                              Icon(Icons.arrow_forward_ios,
                                  size: 15, color: AppColors.secondaryColor)
                            ],
                          ),
                          // discount
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.percent_outlined,
                                  color: AppColors.focusColor,
                                ),
                                Expanded(
                                  child: SimpleText(
                                    text: "Хочу скидку!",
                                    color: AppColors.primaryColor,
                                    size: 14,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    size: 15, color: AppColors.secondaryColor),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                      color: AppColors.secondaryColor.withOpacity(0.1),
                    ),
                    // name
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Header(
                        text: itemName,
                        color: AppColors.primaryColor,
                        size: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // types
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: SimpleText(
                        text: "Тип товара",
                        color: AppColors.primaryColor,
                        size: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          StoreItemType(type: "красный", startPrice: price),
                          StoreItemType(type: "синий", startPrice: price - 100),
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                      color: AppColors.secondaryColor.withOpacity(0.1),
                    ),
                    // description
                    ItemInfo(description: description, specs: specs),
                    // bottom space
                    Container(
                        height: 220,
                        color: AppColors.secondaryColor.withOpacity(0.1))
                  ],
                ),
              ),
            ),
            // bottom bar
            Positioned(bottom: 0, child: BottomBar(price: price)),
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

class StoreItemType extends StatelessWidget {
  final String type;
  final int startPrice;

  const StoreItemType({Key? key, required this.type, required this.startPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backgroundColor,
          border: Border.all(color: AppColors.focusColor, width: 2)),
      child: Column(
        children: [
          SimpleText(text: type, color: AppColors.primaryColor),
          // SimpleText(text: "от $startPrice", color: AppColors.secondaryColor)
        ],
      ),
    );
  }
}

class ItemInfo extends StatefulWidget {
  final String description;
  final String specs;

  const ItemInfo({Key? key, required this.description, required this.specs})
      : super(key: key);

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // tabs
        TabBar(
          indicatorColor: AppColors.focusColor,
          indicatorSize: TabBarIndicatorSize.label,
          controller: tabController,
          tabs: [
            Tab(
              child: Header(
                  text: "ОПИСАНИЕ", color: AppColors.primaryColor, size: 13),
            ),
            Tab(
              child: Header(
                  text: "ХАРАКТЕРИСТИКИ",
                  color: AppColors.primaryColor,
                  size: 13),
            )
          ],
        ),
        // content
        SizedBox(
          height: 200,
          child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                // description
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SimpleText(
                      text: widget.description, color: AppColors.primaryColor),
                ),
                // specs
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SimpleText(
                      text: widget.specs, color: AppColors.primaryColor),
                )
              ]),
        )
      ],
    );
  }
}

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
