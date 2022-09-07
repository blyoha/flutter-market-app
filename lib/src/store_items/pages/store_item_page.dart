import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../shopping_cart/controllers/cart_controller.dart';
import '../../shopping_cart/models/store_item_model.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/item_images.dart';
import '../widgets/item_info.dart';
import '../widgets/item_types.dart';
import '../widgets/top_bar.dart';

// ignore: must_be_immutable
class StoreItemPage extends StatefulWidget {
  final StoreItemModel storeItem;
  late int selectedPrice;
  late int installment;

  StoreItemPage({Key? key, required this.storeItem}) : super(key: key);

  @override
  State<StoreItemPage> createState() => _StoreItemPageState();
}

class _StoreItemPageState extends State<StoreItemPage> {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
                      images: widget.storeItem.images,
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
                                            if (index <
                                                widget.storeItem.rating) {
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
                                    Text(
                                        "${widget.storeItem.reviews.length} отзывов",
                                        style: TextStyle(
                                            color: AppColors.focusColor,
                                            fontSize: 14))
                                  ])
                            ])),
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
                                      child: Text("${widget.selectedPrice} руб",
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold))),
                                  Row(children: [
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 3),
                                        color: const Color.fromRGBO(
                                            255, 225, 120, 1),
                                        child: Text("${widget.installment} руб",
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    Text(" \u00d7 6 мес",
                                        style: TextStyle(
                                            color: AppColors.secondaryColor,
                                            fontSize: 15))
                                  ])
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
                                    child: Text("Хочу скидку!",
                                        style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 14))),
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
                        child: Text(widget.storeItem.name,
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 15,
                    ),
                    // types
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Тип товара",
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 15))),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: ItemTypes(
                          typeList: widget.storeItem.types,
                          storeItem: widget.storeItem,
                          typeSelected: (int index) {
                            setState(() {
                              widget.selectedPrice =
                                  widget.storeItem.types.values.toList()[index];
                              widget.installment =
                                  (widget.selectedPrice / 6).ceil();
                            });
                          }),
                    ),
                    Container(
                      height: 10,
                      color: AppColors.secondaryColor.withOpacity(0.1),
                    ),
                    // description
                    ItemInfo(storeItem: widget.storeItem),
                    // bottom space
                    Container(
                        height: 220,
                        color: AppColors.secondaryColor.withOpacity(0.1))
                  ],
                ),
              ),
            ),
            // bottom bar
            Positioned(
                bottom: 0,
                child: BottomBar(
                    controller: controller,
                    storeItem: widget.storeItem,
                    selectedPrice: widget.selectedPrice)),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    widget.selectedPrice = widget.storeItem.price;
    widget.installment = (widget.selectedPrice / 6).ceil();

    super.initState();
  }
}
