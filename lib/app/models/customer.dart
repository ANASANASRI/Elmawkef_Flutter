class CustomerModel {
  final int id;
  final String name;
  final String phone_number;
  final String? email;
  final String? gender;
  final String? avatar;
  final String? date_of_birth;

  CustomerModel(
      {required this.id,
      required this.name,
      required this.phone_number,
      this.email,
      this.gender,
      this.date_of_birth,
      this.avatar});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        name: json["attributes"]["name"],
        phone_number: json["attributes"]["phone_number"],
        email: json["attributes"]["email"],
        gender: json["attributes"]["gender"],
        date_of_birth: json["attributes"]["date_of_birth"],
        avatar: json["attributes"]["avatar"]["data"]["attributes"]["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phone_number,
        "email": email,
        "gender": gender,
        "date_of_birth": date_of_birth?.toString(),
        "avatar": avatar,
      };
}
