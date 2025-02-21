class PaymentCardModel {
  int id;
  String name;
  String code;
  String date;
  String number;

  PaymentCardModel({
    required this.id,
    required this.name,
    required this.code,
    required this.date,
    required this.number,
  });

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) {
    return PaymentCardModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      date: json['date'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'date': date,
      'number': number,
    };
  }
}
