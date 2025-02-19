class OrderCreateRequest {
  final double total;
  final String address;
  final String shipping;
  final String? promoCode;
  final String paymentId;

  OrderCreateRequest({
    required this.total,
    required this.address,
    required this.shipping,
    this.promoCode,
    required this.paymentId,
  });

  Map<String, dynamic> toJson() => {
    'total': total,
    'address': address,
    'shipping': shipping,
    'promo_code': promoCode,
    'payment_id': paymentId,
  };
}
