class OrderResponse {
  final String code;
  final String productName;
  final int quantity;
  final double price;
  final String imageUrl;
  final String colorHex;
  final double total;
  final String status;
  final String address;
  final double subtotal;
  final String shipping;
  final String? promoCode;
  final String paymentId;
  final String deliveryDate;
  final String paymentMethod;
  final String trackingNumber;

  OrderResponse({
    required this.code,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.colorHex,
    required this.total,
    required this.status,
    required this.address,
    required this.subtotal,
    required this.shipping,
    this.promoCode,
    required this.paymentId,
    required this.deliveryDate,
    required this.paymentMethod,
    required this.trackingNumber,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    code: json['code'],
    productName: json['product_name'],
    quantity: json['quantity'],
    price: json['price'].toDouble(),
    imageUrl: json['image_url'],
    colorHex: json['color_hex'],
    total: json['total']?.toDouble() ?? 0.0,
    status: json['status'],
    address: json['address'],
    subtotal: json['subtotal']?.toDouble() ?? 0.0,
    shipping: json['shipping'],
    promoCode: json['promo_code'],
    paymentId: json['payment_id'],
    deliveryDate: json['delivery_date'],
    paymentMethod: json['payment_method'],
    trackingNumber: json['tracking_number'],
  );
}