import 'package:elmawkef_inc/app/services/remote/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/components/category.dart';

class CategoryController extends GetxController {
  CategoryService categoryService = CategoryService();

  List<Category> categires = [
    Category(
      name: 'Jardinage',
      color: Colors.green,
      icon: Icon(Icons.yard_outlined),
      onClick: () {},
    ),
    Category(
      name: 'Peinture',
      color: Colors.deepPurpleAccent,
      icon: Icon(Icons.format_paint),
      onClick: () {},
    ),
    Category(
      name: 'Serrurerie',
      color: Colors.deepOrange,
      icon: Icon(Icons.lock_open_outlined),
      onClick: () {},
    ),
    Category(
      name: 'Tapisserie',
      color: Colors.indigoAccent,
      icon: Icon(Icons.bed_sharp),
      onClick: () {},
    ),
    Category(
      name: 'Aluminium',
      color: Colors.blueGrey,
      icon: Icon(Icons.featured_video_sharp),
      onClick: () {},
    ),
    Category(
      name: 'Parabole TV',
      color: Colors.blueAccent,
      icon: Icon(Icons.tv),
      onClick: () {},
    ),
    Category(
      name: 'Maçonnerie',
      color: Colors.deepOrangeAccent,
      icon: Icon(Icons.bungalow_outlined),
      onClick: () {},
    ),
    Category(
      name: 'Climatisation',
      color: Colors.pinkAccent,
      icon: Icon(Icons.air_outlined),
      onClick: () {},
    ),
    Category(
      name: 'Camera',
      color: Colors.amberAccent,
      icon: Icon(Icons.camera_indoor_outlined),
      onClick: () {},
    ),
    Category(
      name: 'Parquet',
      color: Colors.lightGreenAccent,
      icon: Icon(Icons.fence_outlined ),
      onClick: () {},
    ),
    Category(
      name: 'Electricité',
      color: Colors.teal,
      icon: Icon(Icons.electric_bolt_rounded),
      onClick: () {},
    ),
    Category(
      name: 'Plomberie',
      color: Colors.blue,
      icon: Icon(Icons.water_drop_outlined),
      onClick: () {},
    ),
  ];

  @override
  void onInit() {
    categories();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void categories() {}
}
