class BasketUpdateRequest {
  final int quantity;
  final int? colorId;
  final int? sizeId;

  BasketUpdateRequest({
    required this.quantity,
    this.colorId,
    this.sizeId,
  });

  Map<String, dynamic> toJson() => {
        'quantity': quantity,
        if (colorId != null) 'color': colorId,
        if (sizeId != null) 'size': sizeId,
      };
}