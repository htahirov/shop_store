class ProductDetailResponse {
  final int id;
  final String slug;
  final String name;
  final List<ProductSize> size;
  final List<ProductColor> color;
  final double price;
  final List<ProductImage> images;
  final double rating;
  final Category category;
  final String description;
  final double totalPrice;
  final int discountInterest;
  final List<dynamic> reviews;
  final int reviewsCount;

  ProductDetailResponse({
    required this.id,
    required this.slug,
    required this.name,
    required this.size,
    required this.color,
    required this.price,
    required this.images,
    required this.rating,
    required this.category,
    required this.description,
    required this.totalPrice,
    required this.discountInterest,
    required this.reviews,
    required this.reviewsCount,
  });

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailResponse(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      size: (json['size'] as List).map((x) => ProductSize.fromJson(x)).toList(),
      color: (json['color'] as List).map((x) => ProductColor.fromJson(x)).toList(),
      price: json['price'].toDouble(),
      images: (json['images'] as List).map((x) => ProductImage.fromJson(x)).toList(),
      rating: json['rating'].toDouble(),
      category: Category.fromJson(json['category']),
      description: json['description'],
      totalPrice: json['total_price'].toDouble(),
      discountInterest: json['discount_interest'],
      reviews: json['reviews'] ?? [],
      reviewsCount: json['reviews count'],
    );
  }
}

class ProductSize {
  final int id;
  final String size;

  ProductSize({required this.id, required this.size});

  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return ProductSize(
      id: json['id'],
      size: json['size'],
    );
  }
}

class ProductColor {
  final int id;
  final String color;

  ProductColor({required this.id, required this.color});

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      id: json['id'],
      color: json['color'],
    );
  }
}

class ProductImage {
  final String image;

  ProductImage({required this.image});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      image: json['image'],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String? logo;

  Category({required this.id, required this.name, this.logo});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
    );
  }
}