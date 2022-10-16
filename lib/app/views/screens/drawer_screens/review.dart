import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class Review extends GetResponsiveView {
  RxDouble rating = 3.0.obs;

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Review"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rating App",
                style: Get.textTheme.labelLarge!.copyWith(fontSize: 22),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "give us feedback about a facebook feature",
                style: Get.textTheme.labelMedium!.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Obx(
                () => Text(
                  "${rating.value}",
                  style: Get.textTheme.labelLarge!.copyWith(fontSize: 18),
                ),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rat) {
                  rating.value = rat;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
