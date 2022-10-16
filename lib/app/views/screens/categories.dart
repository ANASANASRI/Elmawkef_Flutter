import 'package:elmawkef_inc/app/controllers/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/categories.dart';
import '../components/view_all.dart';

class Categories extends GetResponsiveView {
  final bottom = Get.put(BottomNavigationController());
  CategoryController service = CategoryController();

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        title: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VerticalDivider(
                color: ThemeData.light().colorScheme.secondary,
                thickness: 3.5,
                width: 16,
                indent: 3,
                endIndent: 3,
              ),
              RichText(
                text: TextSpan(
                  text: "Elma",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize:
                        Theme.of(screen.context).textTheme.headline5?.fontSize,
                  ),
                  children: [
                    TextSpan(
                      text: "Wkef",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: Theme.of(screen.context)
                            .textTheme
                            .headline5
                            ?.fontSize,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Card(
          elevation: 1,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: ViewAll(
                  title: "All Categories".tr,
                  buttonTitle: '',
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: screen.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: screen.width * 0.3,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 4),
                      itemCount: service.categires.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return service.categires[index];
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
