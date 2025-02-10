class ProductResponse {
  final int? count;
  final String? next;
  final String? previous;
  final int? currentPage;
  final int? firstPage;
  final int? lastPage;
  final List<Result>? results;

  ProductResponse({
    this.count,
    this.next,
    this.previous,
    this.currentPage,
    this.firstPage,
    this.lastPage,
    this.results,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        currentPage: json["current_page"],
        firstPage: json["first_page"],
        lastPage: json["last_page"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "current_page": currentPage,
        "first_page": firstPage,
        "last_page": lastPage,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  final int? id;
  final int? product;
  final String? slug;
  final String? name;
  final Image? image;
  final double? rating;
  final Category? category;
  final double? totalPrice;
  final int? discountInterest;

  Result({
    this.id,
    this.product,
    this.slug,
    this.name,
    this.image,
    this.rating,
    this.category,
    this.totalPrice,
    this.discountInterest,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        product: json["product"],
        slug: json["slug"],
        name: json["name"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        rating: json["rating"]?.toDouble(),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        totalPrice: json["totalprice"]?.toDouble(),
        discountInterest: json["discount_interest"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "image": image?.toJson(),
        "rating": rating,
        "category": category?.toJson(),
        "totalprice": totalPrice,
        "discount_interest": discountInterest,
      };
}

class Category {
  final int? id;
  final String? name;
  final String? logo;

  Category({
    this.id,
    this.name,
    this.logo,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}

class Image {
  final String? image;

  Image({
    this.image,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
