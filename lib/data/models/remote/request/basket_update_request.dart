class BasketUpdateRequest {
  final int quantity;

  BasketUpdateRequest({required this.quantity});

  Map<String, dynamic> toJson() => {'quantity': quantity};
}