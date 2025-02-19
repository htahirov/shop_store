class PromoCodeRequest {
  final String promoCode;

  PromoCodeRequest({required this.promoCode});

  Map<String, dynamic> toJson() => {
    'promo_code': promoCode,
  };
}