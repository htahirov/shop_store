class BasketItem {
  final int id;
  final String name;
  final String image;
  final int quantity;
  final String colorChoices;
  final String totalPrice;

  BasketItem({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.colorChoices,
    required this.totalPrice,
  });

  factory BasketItem.fromJson(Map<String, dynamic> json) => BasketItem(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
        quantity: json['quantity'] as int,
        colorChoices: json['color_choices'] as String,
        totalPrice: json['total_price'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'quantity': quantity,
        'color_choices': colorChoices,
        'total_price': totalPrice,
      };
}