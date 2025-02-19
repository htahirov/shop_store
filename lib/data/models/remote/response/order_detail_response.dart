class OrderDetailResponse {
  final String code;
  final String status;
  final String date;
  final String resiNumber;
  final String deliveryService;
  final String paymentMethod;
  final List<OrderDetailItem> items;
  final double total;
  final double subtotal;
  final String address;
  final String? promoCode;
  final double shipping;

  OrderDetailResponse({
    required this.code,
    required this.status,
    required this.date,
    required this.resiNumber,
    required this.deliveryService,
    required this.paymentMethod,
    required this.items,
    required this.total,
    required this.subtotal,
    required this.address,
    this.promoCode,
    required this.shipping,
  });

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) => OrderDetailResponse(
    code: json['code'] ?? '',
    status: json['status'] ?? '',
    date: json['date'] ?? '',
    resiNumber: json['resi_number'] ?? '',
    deliveryService: json['delivery_service'] ?? '',
    paymentMethod: json['payment_method'] ?? '',
    items: json['items'] != null 
        ? List<OrderDetailItem>.from(
            json['items'].map((x) => OrderDetailItem.fromJson(x)))
        : [],
    total: (json['total'] ?? 0).toDouble(),
    subtotal: (json['subtotal'] ?? 0).toDouble(),
    address: json['address'] ?? '',
    promoCode: json['promo_code'],
    shipping: (json['shipping'] ?? 0).toDouble(),
  );
}

class OrderDetailItem {
  final String name;
  final int quantity;
  final double price;

  OrderDetailItem({
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory OrderDetailItem.fromJson(Map<String, dynamic> json) => OrderDetailItem(
    name: json['name'] ?? '',
    quantity: json['quantity'] ?? 0,
    price: (json['price'] ?? 0).toDouble(),
  );
}