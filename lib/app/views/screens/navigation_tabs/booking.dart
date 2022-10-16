import 'package:elmawkef_inc/app/controllers/booking.dart';
import 'package:elmawkef_inc/app/models/work.dart';
import 'package:elmawkef_inc/app/router/routers.dart';
import 'package:elmawkef_inc/app/views/components/section_title.dart';
import 'package:elmawkef_inc/app/views/components/service_card.dart';
import 'package:elmawkef_inc/app/views/screens/empty_state/booking.dart';
import 'package:elmawkef_inc/app/views/screens/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Booking extends GetResponsiveView<BookingController> {
  @override
  final controller = Get.put(BookingController());

  @override
  Widget? phone() {
    return Scaffold(
      drawer: AppDrawer(screen: screen),
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
      body: Obx(() {
        return controller.bookingsList.value.isEmpty
            ? EmptyBooking(screen: screen)
            : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                  child: SectionTitle(
                    text: 'Booking items'.tr,
                    alignment: MainAxisAlignment.start,
                  ),
                ),
                Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 16.0,
                            childAspectRatio: 0.9,
                          ),
                          itemCount: controller.bookingsList.value.length,
                          itemBuilder: (BuildContext ctx, index) {
                            WorkModel serviceModel =
                                controller.bookingsList.value[index];
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
                          }),
                    ),
                ),
              ],
            );
      }),
    );
  }
}