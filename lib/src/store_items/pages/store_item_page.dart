import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../main/widgets/text.dart';
import '../../shopping_cart/models/store_item_model.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/item_images.dart';
import '../widgets/item_info.dart';
import '../widgets/store_item_types.dart';
import '../widgets/top_bar.dart';

class StoreItemPage extends StatelessWidget {
  final StoreItemModel storeItem;

  const StoreItemPage({Key? key, required this.storeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int installment = (storeItem.price / 6).ceil();

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
                    ItemImages(
                      images: storeItem.images,
                    ),
                    const SizedBox(height: 15),
                    // rating, reviews
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
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
                                      if (index < storeItem.rating) {
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
                                text: "${storeItem.reviews.length} отзывов",
                                color: AppColors.focusColor,
                                size: 14,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                      color: AppColors.secondaryColor.withOpacity(0.1),
                    ),
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
                                      text: "${storeItem.price} руб",
                                      color: AppColors.primaryColor,
                                      size: 30,
                                    ),
                                  ),
                                  Row(children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 3),
                                      color: const Color.fromRGBO(
                                          255, 225, 120, 1),
                                      child: SimpleText(
                                        text: "$installment руб",
                                        color: AppColors.primaryColor,
                                        size: 18,
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Header(
                        text: storeItem.name,
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
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: StoreItemTypes(typeList: storeItem.types),
                    ),
                    Container(
                      height: 10,
                      color: AppColors.secondaryColor.withOpacity(0.1),
                    ),
                    // description
                    ItemInfo(storeItem: storeItem),
                    // bottom space
                    Container(
                        height: 220,
                        color: AppColors.secondaryColor.withOpacity(0.1))
                  ],
                ),
              ),
            ),
            // bottom bar
            Positioned(bottom: 0, child: BottomBar(price: storeItem.price)),
          ],
        ),
      ),
    );
  }
}
