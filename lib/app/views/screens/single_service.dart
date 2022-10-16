import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:elmawkef_inc/app/controllers/booking.dart';
import 'package:elmawkef_inc/app/controllers/single_service.dart';
import 'package:elmawkef_inc/app/models/customer.dart';
import 'package:elmawkef_inc/app/models/work.dart';
import 'package:elmawkef_inc/app/router/routers.dart';
import 'package:elmawkef_inc/app/services/remote/customer.dart';
import 'package:elmawkef_inc/app/views/components/service_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleService extends GetResponsiveView<SingleServiceController> {
  @override
  final controller = Get.put(SingleServiceController());
  CustomerService customerService = CustomerService();
  BookingController bookingController = Get.put(BookingController());

  @override
  Widget? phone() {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: screen.height * 0.32,
              flexibleSpace: FlexibleSpaceBar(
                title: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Text(
                      controller.workModel.title,
                      style: Theme.of(screen.context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                centerTitle: true,
                background: CarouselSlider(
                  items: controller.workModel.samples.map((data) {
                    // Make sure to return the result.
                    return Image.network(
                      "https://app.elmawkef.com" + data.image,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                  // carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.5,
                    aspectRatio: 0.5,
                    initialPage: 0,
                  ),
                ),
              ),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: FutureBuilder<CustomerModel>(
                  builder: (BuildContext context,
                      AsyncSnapshot<CustomerModel> snapshot) {
                    if (snapshot.connectionState == ConnectionState.none) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      CustomerModel? customerModel = snapshot.data;
                      return Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage: NetworkImage(
                                      "${"https://app.elmawkef.com" + customerModel!.avatar.toString()}"),
                                  backgroundColor: Colors.transparent,
                                ),
                                title: Text(customerModel!.name.toUpperCase()),
                                subtitle: Text(controller.workModel.category +
                                    " , " +
                                    controller.workModel.experience.toString() +
                                    " Experience"),
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      bookingController
                                          .addBooking(controller.workModel);
                                    },
                                    child: Obx(() => Text(
                                          bookingController
                                                  .isInBookin(
                                                      controller.workModel)
                                                  .value
                                              ? "Debook"
                                              : "Booking",
                                          style: TextStyle(
                                              color: bookingController
                                                      .isInBookin(
                                                          controller.workModel)
                                                      .value
                                                  ? Colors.green.shade500
                                                  : Colors.blueGrey),
                                        )),
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: screen.width * 0.1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screen.width * 0.1,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final Uri launchUri = Uri(
                                        scheme: 'tel',
                                        path: "+212" +
                                            customerModel.phone_number
                                                .toString(),
                                      );
                                      await launchUrl(launchUri);
                                    },
                                    child: Text("Call Now"),
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: screen.width * 0.1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  future: customerService
                      .fetchUserById(controller.workModel.customer_id),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: FutureBuilder<List<WorkModel>?>(
                builder: (BuildContext context,
                    AsyncSnapshot<List<WorkModel>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.none) {
                    return SliverToBoxAdapter(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[350]!,
                        highlightColor: Colors.grey[100]!,
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
                  }
                  if (snapshot.hasData) {
                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 2.0,
                        childAspectRatio: 0.87,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          WorkModel serviceModel = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.service,
                                  arguments: serviceModel);
                            },
                            child: ServiceCard(
                              title: serviceModel.title,
                              image: "https://app.elmawkef.com" +
                                  serviceModel.samples[0].image,
                              screen: screen,
                              onPress: () {
                                Get.toNamed(
                                  AppRoutes.service,
                                  arguments: serviceModel,
                                  preventDuplicates: false,
                                );
                              },
                              width: screen.width * 0.4,
                              height: screen.height * 0.2,
                            ),
                          );
                        },
                        childCount: snapshot.data?.length,
                      ),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[350]!,
                      highlightColor: Colors.grey[100]!,
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
            )
          ],
        ),
      ),
    );
  }
}
