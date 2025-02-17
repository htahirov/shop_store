class BasketItem {
  final int id;
  final String name;
  final ImageModel image;
  final int quantity;
  final List<ColorChoice> colorChoices;
  final double totalPrice;
  final ProductVariant productColor;
  final ProductVariant productSize;
  final List<SizeChoice> sizeChoices;

  BasketItem({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.colorChoices,
    required this.totalPrice,
    required this.productColor,
    required this.productSize,
    required this.sizeChoices,
  });

  factory BasketItem.fromJson(Map<String, dynamic> json) {
    return BasketItem(
      id: json['id'] as int,
      name: json['name'] as String,
      image: ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      colorChoices: (json['color_choices'] as List)
          .map((x) => ColorChoice.fromJson(x as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['total_price'] as num).toDouble(),
      productColor: ProductVariant.fromJson(json['product_color'] as Map<String, dynamic>),
      productSize: ProductVariant.fromJson(json['product_size'] as Map<String, dynamic>),
      sizeChoices: (json['size_choices'] as List)
          .map((x) => SizeChoice.fromJson(x as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ImageModel {
  final String image;

  ImageModel({required this.image});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      image: json['image'] as String,
    );
  }
}

class ColorChoice {
  final int id;
  final String color;

  ColorChoice({
    required this.id,
    required this.color,
  });

  factory ColorChoice.fromJson(Map<String, dynamic> json) {
    return ColorChoice(
      id: json['id'] as int,
      color: json['color'] as String,
    );
  }
}

class ProductVariant {
  final int id;
  final String color;
  final String? size;

  ProductVariant({
    required this.id,
    required this.color,
    this.size,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      id: json['id'] as int,
      color: json['color'] as String? ?? '',
      size: json['size'] as String?,
    );
  }
}

class SizeChoice {
  final int id;
  final String size;

  SizeChoice({
    required this.id,
    required this.size,
  });

  factory SizeChoice.fromJson(Map<String, dynamic> json) {
    return SizeChoice(
      id: json['id'] as int,
      size: json['size'] as String,
    );
  }
}