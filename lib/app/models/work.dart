import 'package:elmawkef_inc/app/models/sample.dart';

class WorkModel {
  final int id;
  final int experience;
  final int customer_id;
  final int category_id;
  final String title;
  final String category;
  final String description;
  final List<SampleModel> samples;

  WorkModel(
      {required this.id,
      required this.experience,
      required this.customer_id,
      required this.category_id,
      required this.title,
      required this.category,
      required this.description,
      required this.samples});

  factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        id: json["id"],
        experience: json["attributes"]["customer_id"]["data"]["attributes"]
            ["experience"],
        customer_id: json["attributes"]["customer_id"]["data"]["id"],
        title: json["attributes"]["title"],
        category: json["attributes"]["category"]["data"]["attributes"]["name"],
        category_id: json["attributes"]["category"]["data"]["id"],
        description: json["attributes"]["customer_id"]["data"]["attributes"]
            ["description"],
        samples: List.from(json["attributes"]["samples"]["data"])
            .map((item) => SampleModel.fromJson(item))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "experience": experience,
        "customer_id": customer_id,
        "category_id": category_id,
        "title": title,
        "category": category,
        "description": description,
        "samples": samples,
      };
}
