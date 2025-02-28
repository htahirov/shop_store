import 'dart:convert';

class AddressModel {
  final String addressName;
  final String phoneNumber;
  final String city;
  final String state;
  final String zipCode;

  AddressModel({
    required this.addressName,
    required this.phoneNumber,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory AddressModel.fromRawJson(String str) =>
      AddressModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addressName: json["address_name"],
        phoneNumber: json["phone_number"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
      );

  Map<String, dynamic> toJson() => {
        "address_name": addressName,
        "phone_number": phoneNumber,
        "city": city,
        "state": state,
        "zip_code": zipCode,
      };
}
