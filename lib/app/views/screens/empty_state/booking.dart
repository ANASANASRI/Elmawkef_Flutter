import 'package:elmawkef_inc/app/controllers/bottom_nav.dart';
import 'package:elmawkef_inc/app/views/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyBooking extends StatelessWidget {
  EmptyBooking({Key? key, @required this.screen}) : super(key: key);
  final screen;
  final bottomNavController = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SectionTitle(
            text: "Bookings".tr,
            alignment: MainAxisAlignment.start,
          ),
          SizedBox(
            width: screen.width,
            height: screen.height * 0.67,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Card(
                elevation: 1,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 36, vertical: 48),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.asset(
                          'assets/images/booking.png',
                          fit: BoxFit.contain,
                        ),
                        width: screen.width * 0.5,
                        height: screen.height * 0.11,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "No Upcoming Order".tr,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Currently you don’t have any upcoming order. Place and track your orders from here."
                            .tr,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            bottomNavController.updateIndex(0);
                          },
                          child: Text(
                            'View All Services'.tr,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
