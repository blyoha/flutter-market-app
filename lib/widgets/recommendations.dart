import 'package:flutter/material.dart';
import 'package:ozon_app/utils/app_colors.dart';
import 'package:ozon_app/widgets/text.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pageCount = 4;

    List<Color> content = [
      Colors.indigo,
      Colors.orange,
      Colors.purple,
      Colors.lightGreen,
    ];

    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: PageController(),
        itemCount: pageCount,
        itemBuilder: (_, index) {
          return Stack(
              alignment: FractionalOffset.topCenter,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: content[index],
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Center(
                      child: Header(
                    text: "RECOMMENDATION ${index + 1}",
                    color: AppColors.primaryColor,
                    size: 30,
                  ))),
              Positioned(
                left: 170,
                bottom: 30,
                child: Row(
                  children: List.generate(pageCount, (dotIndex) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == dotIndex
                              ? Colors.white
                              : Colors.white.withOpacity(0.3)),
                    );
                  }),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
