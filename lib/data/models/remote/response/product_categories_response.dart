class ProductCategoryResponse {
    int id;
    String name;
    dynamic logo;
    List<ProductCategoryResponse>? children;

    ProductCategoryResponse({
        required this.id,
        required this.name,
        required this.logo,
        this.children,
    });

    factory ProductCategoryResponse.fromJson(Map<String, dynamic> json) => ProductCategoryResponse(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        children: json["children"] == null ? [] : List<ProductCategoryResponse>.from(json["children"]!.map((x) => ProductCategoryResponse.fromJson(x))),
    );

    factory ProductCategoryResponse.mock() {
      return ProductCategoryResponse(
        id: 1,
        name: 'Accessories',
        logo: null,
        children: [
          ProductCategoryResponse(
             id: 1,
            name: 'Belts',
            logo: null,
          ),
        ],
      );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x.toJson())),
    };
}