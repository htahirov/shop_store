class PromoCodeResponse {
  final String promoCode;
  final double discountPrice;

  PromoCodeResponse({
    required this.promoCode,
    required this.discountPrice,
  });

  factory PromoCodeResponse.fromJson(Map<String, dynamic> json) => 
    PromoCodeResponse(
      promoCode: json['promo_code'],
      discountPrice: json['discount_price']?.toDouble() ?? 0.0,
    );
}