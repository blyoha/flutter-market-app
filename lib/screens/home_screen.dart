import 'package:flutter/material.dart';
import 'package:ozon_app/widgets/search_bar.dart';
import 'package:ozon_app/widgets/section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pickupPoint = "ул. Бабушкина, 223";

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Stack(
          children: [
            // top search
            Positioned(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    // flight icon
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.flight),
                    ),
                    // search bar
                    Expanded(
                      child: SearchBar(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.notifications_none),
                    )
                  ],
                )),
            // main content
            Positioned(
                top: 50,
                left: 0,
                height: double.maxFinite,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    // pickup point
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.red, width: 1))),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          Text("Пункт Ozon | $pickupPoint"),
                          Expanded(child: Container()),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    // recommendation cards
                    SizedBox(
                      height: 180,
                      child: PageView(
                          children: List.generate(
                              3,
                              (index) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: [Colors.indigo, Colors.orange, Colors.purple][index],
                                    ),
                                    margin: const EdgeInsets.all(20),
                                    child: Center(
                                        child: Text("RECOMMENDATION ${index+1}")),
                                  ))),
                    ),
                    // sections
                    SizedBox(
                      height: 180,
                      child: PageView(children: [
                        Wrap(
                            children: List.generate(
                                6,
                                (index) => const Section(
                                    icon: Icons.menu_outlined,
                                    text: "Каталог"))),
                        Wrap(
                            children: List.generate(
                                6,
                                (index) => const Section(
                                    icon: Icons.document_scanner_outlined,
                                    text: "Офис"))),
                      ]),
                    )
                  ],
                ))),
          ],
        ),
      ),
    );
  }
}
