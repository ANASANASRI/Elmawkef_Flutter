class SampleModel {
  final int id;
  final String image;

  SampleModel({required this.id, required this.image});

  factory SampleModel.fromJson(Map<String, dynamic> json) => SampleModel(
        id: json["id"],
        image: json["attributes"]["formats"]["thumbnail"]["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": image,
      };
}
