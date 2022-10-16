import 'package:elmawkef_inc/app/controllers/categories.dart';
import 'package:elmawkef_inc/app/controllers/home_page.dart';
import 'package:elmawkef_inc/app/models/work.dart';
import 'package:elmawkef_inc/app/router/routers.dart';
import 'package:elmawkef_inc/app/views/components/category.dart';
import 'package:elmawkef_inc/app/views/components/service_card.dart';
import 'package:elmawkef_inc/app/views/components/view_all.dart';
import 'package:elmawkef_inc/app/views/screens/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Home extends GetResponsiveView {
  @override
  final controller = Get.put(HomePageController());
  CategoryController c = CategoryController();

  @override
  Widget? phone() {
    return Scaffold(
      drawer: AppDrawer(screen: screen),
      appBar: AppBar(
        centerTitle: false,
        title: Text("Elmawkef"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            elevation: 1,
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<String?>(
                    future: controller.getUserName(),
                    builder: (BuildContext context,
                        AsyncSnapshot<String?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.none) {
                        return Text(
                          "HELLO User",
                          style: Theme.of(screen.context).textTheme.titleMedium,
                        );
                      }
                      if (snapshot.hasData) {
                        return Text(
                          "HELLO ${snapshot.data}",
                          style: Theme.of(screen.context).textTheme.titleMedium,
                        );
                      }
                      return Text(
                        "HELLO User",
                        style: Theme.of(screen.context).textTheme.titleMedium,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "What you are Searching about".tr,
                    style: Theme.of(screen.context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter what you search'.tr,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),
          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Category(
                    name: 'Jardinage',
                    icon: const Icon(Icons.yard_outlined),
                    color: Colors.green,
                    onClick: () {},
                  ),
                  Category(
                    name: 'Electricité',
                    icon: const Icon(Icons.electric_bolt_rounded),
                    color: Colors.teal,
                    onClick: () {},
                  ),
                  Category(
                    name: 'Tapisserie',
                    icon: const Icon(Icons.bed_sharp),
                    color: Colors.red,
                    onClick: () {},
                  ),
                  Category(
                    name: 'See All'.tr,
                    icon: const Icon(Icons.arrow_forward_outlined),
                    color: Colors.blueGrey.shade900.withOpacity(0.9),
                    onClick: () {
                      Get.toNamed(AppRoutes.allCategories);
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Card(
            elevation: 1,
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
                  child: ViewAll(
                    title: "Recent".tr,
                    buttonTitle: "See All".tr,
                    onPressed: () {
                      Get.toNamed(AppRoutes.services);
                    },
                  ),
                ),
                SizedBox(
                  height: screen.height * 0.25,
                  child: FutureBuilder<List<WorkModel>?>(
                    builder: (BuildContext context,
                        AsyncSnapshot<List<WorkModel>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.none) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              WorkModel serviceModel = snapshot.data![index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: ServiceCard(
                                  title: serviceModel.title,
                                  image: "https://app.elmawkef.com" +
                                      serviceModel.samples[0].image,
                                  screen: screen,
                                  onPress: () {
                                    Get.toNamed(AppRoutes.service,
                                        arguments: serviceModel,
                                        preventDuplicates: false);
                                  },
                                  width: screen.width * 0.4,
                                  height: screen.height * 0.2,
                                ),
                              );
                            });
                      }
                      return Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SizedBox(
                                  width: screen.width * 0.4,
                                  height: screen.height * 0.2,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    future: controller.workService.fetchService(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
