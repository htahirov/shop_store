class BasketCreateRequest {
  final int quantity;
  final int product;
  final int color;
  final int size;

  BasketCreateRequest({
    required this.quantity,
    required this.product,
    required this.color,
    required this.size,
  });

  Map<String, dynamic> toJson() => {
        'quantity': quantity,
        'product': product,
        'color': color,
        'size': size,
      };
}
