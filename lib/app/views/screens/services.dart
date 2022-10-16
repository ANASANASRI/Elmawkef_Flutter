import 'package:elmawkef_inc/app/models/work.dart';
import 'package:elmawkef_inc/app/router/routers.dart';
import 'package:elmawkef_inc/app/services/remote/services.dart';
import 'package:elmawkef_inc/app/views/components/section_title.dart';
import 'package:elmawkef_inc/app/views/components/service_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Services extends GetResponsiveView {
  WorkService workService = WorkService();

  @override
  Widget? phone() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screen.height * 0.09),
        child: AppBar(
          title: SizedBox(
            height: screen.height * 0.065,
            width: double.infinity,
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'Find What You need  Here'.tr,
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
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              child: SectionTitle(
                text: 'All Services'.tr,
                alignment: MainAxisAlignment.start,
              ),
            ),
            Flexible(
              child: FutureBuilder<List<WorkModel>?>(
                builder: (BuildContext context,
                    AsyncSnapshot<List<WorkModel>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.none) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 16.0,
                          childAspectRatio: 0.9,
                        ),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          WorkModel serviceModel = snapshot.data![index];
                          return ServiceCard(
                            title: serviceModel.title,
                            image: "https://app.elmawkef.com" +
                                serviceModel.samples[0].image,
                            screen: screen,
                            onPress: () {
                              Get.toNamed(AppRoutes.service,
                                  arguments: serviceModel);
                            },
                            width: screen.width * 0.4,
                            height: screen.height * 0.2,
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                future: workService.fetchService(),
              ),
            ),
          ],
        ),
      ),);
  }
}
