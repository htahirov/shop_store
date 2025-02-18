class OrderCancelRequest {
  final String code;

  OrderCancelRequest({required this.code});

  Map<String, dynamic> toJson() => {
    'code': code,
  };
}