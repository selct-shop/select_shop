import 'dart:convert';

class GetAllProductsOfACategoryModel {
    ProductsOfACategoryResult result;
    int statusCode;
    String message;

    GetAllProductsOfACategoryModel({
        required this.result,
        required this.statusCode,
        required this.message,
    });

    GetAllProductsOfACategoryModel copyWith({
        ProductsOfACategoryResult? result,
        int? statusCode,
        String? message,
    }) => 
        GetAllProductsOfACategoryModel(
            result: result ?? this.result,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
        );

    factory GetAllProductsOfACategoryModel.fromRawJson(String str) => GetAllProductsOfACategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetAllProductsOfACategoryModel.fromJson(Map<String, dynamic> json) => GetAllProductsOfACategoryModel(
        result: ProductsOfACategoryResult.fromJson(json["result"]),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class ProductsOfACategoryResult {
    List<CategoryProduct> categoryProducts;
    int categoryProductsCount;

    ProductsOfACategoryResult({
        required this.categoryProducts,
        required this.categoryProductsCount,
    });

    ProductsOfACategoryResult copyWith({
        List<CategoryProduct>? categoryProducts,
        int? categoryProductsCount,
    }) => 
        ProductsOfACategoryResult(
            categoryProducts: categoryProducts ?? this.categoryProducts,
            categoryProductsCount: categoryProductsCount ?? this.categoryProductsCount,
        );

    factory ProductsOfACategoryResult.fromRawJson(String str) => ProductsOfACategoryResult.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductsOfACategoryResult.fromJson(Map<String, dynamic> json) => ProductsOfACategoryResult(
        categoryProducts: List<CategoryProduct>.from(json["categoryProducts"].map((x) => CategoryProduct.fromJson(x))),
        categoryProductsCount: json["categoryProductsCount"],
    );

    Map<String, dynamic> toJson() => {
        "categoryProducts": List<dynamic>.from(categoryProducts.map((x) => x.toJson())),
        "categoryProductsCount": categoryProductsCount,
    };
}

class CategoryProduct {
    int id;
    String nameEn;
    String nameAr;
    String descriptionEn;
    String descriptionAr;
    String price;
    int categoryId;
    int brandId;
    bool isApproved;
    dynamic approvedBy;
    bool isDeleted;
    String? deletedBy;
    DateTime createdAt;
    String createdBy;
    DateTime updatedAt;
    dynamic updatedBy;
    bool isPaused;
    dynamic pausedBy;
    String slug;
    dynamic sku;
    dynamic tags;
    dynamic status;
    Brand brand;
    List<ProductAttribute> productAttributes;
    Category category;

    CategoryProduct({
        required this.id,
        required this.nameEn,
        required this.nameAr,
        required this.descriptionEn,
        required this.descriptionAr,
        required this.price,
        required this.categoryId,
        required this.brandId,
        required this.isApproved,
        required this.approvedBy,
        required this.isDeleted,
        required this.deletedBy,
        required this.createdAt,
        required this.createdBy,
        required this.updatedAt,
        required this.updatedBy,
        required this.isPaused,
        required this.pausedBy,
        required this.slug,
        required this.sku,
        required this.tags,
        required this.status,
        required this.brand,
        required this.productAttributes,
        required this.category,
    });

    CategoryProduct copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? descriptionEn,
        String? descriptionAr,
        String? price,
        int? categoryId,
        int? brandId,
        bool? isApproved,
        dynamic approvedBy,
        bool? isDeleted,
        String? deletedBy,
        DateTime? createdAt,
        String? createdBy,
        DateTime? updatedAt,
        dynamic updatedBy,
        bool? isPaused,
        dynamic pausedBy,
        String? slug,
        dynamic sku,
        dynamic tags,
        dynamic status,
        Brand? brand,
        List<ProductAttribute>? productAttributes,
        Category? category,
    }) => 
        CategoryProduct(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            descriptionEn: descriptionEn ?? this.descriptionEn,
            descriptionAr: descriptionAr ?? this.descriptionAr,
            price: price ?? this.price,
            categoryId: categoryId ?? this.categoryId,
            brandId: brandId ?? this.brandId,
            isApproved: isApproved ?? this.isApproved,
            approvedBy: approvedBy ?? this.approvedBy,
            isDeleted: isDeleted ?? this.isDeleted,
            deletedBy: deletedBy ?? this.deletedBy,
            createdAt: createdAt ?? this.createdAt,
            createdBy: createdBy ?? this.createdBy,
            updatedAt: updatedAt ?? this.updatedAt,
            updatedBy: updatedBy ?? this.updatedBy,
            isPaused: isPaused ?? this.isPaused,
            pausedBy: pausedBy ?? this.pausedBy,
            slug: slug ?? this.slug,
            sku: sku ?? this.sku,
            tags: tags ?? this.tags,
            status: status ?? this.status,
            brand: brand ?? this.brand,
            productAttributes: productAttributes ?? this.productAttributes,
            category: category ?? this.category,
        );

    factory CategoryProduct.fromRawJson(String str) => CategoryProduct.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoryProduct.fromJson(Map<String, dynamic> json) => CategoryProduct(
        id: json["id"],
        nameEn: json["nameEn"],
        nameAr: json["nameAr"],
        descriptionEn: json["descriptionEn"],
        descriptionAr: json["descriptionAr"],
        price: json["price"],
        categoryId: json["categoryId"],
        brandId: json["brandId"],
        isApproved: json["isApproved"],
        approvedBy: json["approvedBy"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        updatedBy: json["updatedBy"],
        isPaused: json["isPaused"],
        pausedBy: json["pausedBy"],
        slug: json["slug"],
        sku: json["sku"],
        tags: json["tags"],
        status: json["status"],
        brand: Brand.fromJson(json["brand"]),
        productAttributes: List<ProductAttribute>.from(json["productAttributes"].map((x) => ProductAttribute.fromJson(x))),
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameEn": nameEn,
        "nameAr": nameAr,
        "descriptionEn": descriptionEn,
        "descriptionAr": descriptionAr,
        "price": price,
        "categoryId": categoryId,
        "brandId": brandId,
        "isApproved": isApproved,
        "approvedBy": approvedBy,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "createdAt": createdAt.toIso8601String(),
        "createdBy": createdBy,
        "updatedAt": updatedAt.toIso8601String(),
        "updatedBy": updatedBy,
        "isPaused": isPaused,
        "pausedBy": pausedBy,
        "slug": slug,
        "sku": sku,
        "tags": tags,
        "status": status,
        "brand": brand.toJson(),
        "productAttributes": List<dynamic>.from(productAttributes.map((x) => x.toJson())),
        "category": category.toJson(),
    };
}

class Brand {
    String nameAr;
    String nameEn;
    String image;

    Brand({
        required this.nameAr,
        required this.nameEn,
        required this.image,
    });

    Brand copyWith({
        String? nameAr,
        String? nameEn,
        String? image,
    }) => 
        Brand(
            nameAr: nameAr ?? this.nameAr,
            nameEn: nameEn ?? this.nameEn,
            image: image ?? this.image,
        );

    factory Brand.fromRawJson(String str) => Brand.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "nameAr": nameAr,
        "nameEn": nameEn,
        "image": image,
    };
}

class Category {
    String nameAr;
    String nameEn;

    Category({
        required this.nameAr,
        required this.nameEn,
    });

    Category copyWith({
        String? nameAr,
        String? nameEn,
    }) => 
        Category(
            nameAr: nameAr ?? this.nameAr,
            nameEn: nameEn ?? this.nameEn,
        );

    factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
    );

    Map<String, dynamic> toJson() => {
        "nameAr": nameAr,
        "nameEn": nameEn,
    };
}

class ProductAttribute {
    int id;
    int productId;
    dynamic propValueId;
    int? colorId;
    int inventoryId;
    bool isDeleted;
    dynamic deletedBy;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic updatedBy;
    List<Image> images;
    Color? color;
    dynamic propValue;
    Inventory inventory;

    ProductAttribute({
        required this.id,
        required this.productId,
        required this.propValueId,
        required this.colorId,
        required this.inventoryId,
        required this.isDeleted,
        required this.deletedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.updatedBy,
        required this.images,
        required this.color,
        required this.propValue,
        required this.inventory,
    });

    ProductAttribute copyWith({
        int? id,
        int? productId,
        dynamic propValueId,
        int? colorId,
        int? inventoryId,
        bool? isDeleted,
        dynamic deletedBy,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic updatedBy,
        List<Image>? images,
        Color? color,
        dynamic propValue,
        Inventory? inventory,
    }) => 
        ProductAttribute(
            id: id ?? this.id,
            productId: productId ?? this.productId,
            propValueId: propValueId ?? this.propValueId,
            colorId: colorId ?? this.colorId,
            inventoryId: inventoryId ?? this.inventoryId,
            isDeleted: isDeleted ?? this.isDeleted,
            deletedBy: deletedBy ?? this.deletedBy,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            updatedBy: updatedBy ?? this.updatedBy,
            images: images ?? this.images,
            color: color ?? this.color,
            propValue: propValue ?? this.propValue,
            inventory: inventory ?? this.inventory,
        );

    factory ProductAttribute.fromRawJson(String str) => ProductAttribute.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductAttribute.fromJson(Map<String, dynamic> json) => ProductAttribute(
        id: json["id"],
        productId: json["productId"],
        propValueId: json["propValueId"],
        colorId: json["colorId"],
        inventoryId: json["inventoryId"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        updatedBy: json["updatedBy"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        color: json["color"] == null ? null : Color.fromJson(json["color"]),
        propValue: json["propValue"],
        inventory: Inventory.fromJson(json["inventory"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "propValueId": propValueId,
        "colorId": colorId,
        "inventoryId": inventoryId,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "updatedBy": updatedBy,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "color": color?.toJson(),
        "propValue": propValue,
        "inventory": inventory.toJson(),
    };
}

class Color {
    int id;
    String value;
    String nameEn;
    String nameAr;

    Color({
        required this.id,
        required this.value,
        required this.nameEn,
        required this.nameAr,
    });

    Color copyWith({
        int? id,
        String? value,
        String? nameEn,
        String? nameAr,
    }) => 
        Color(
            id: id ?? this.id,
            value: value ?? this.value,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
        );

    factory Color.fromRawJson(String str) => Color.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        value: json["value"],
        nameEn: json["nameEn"],
        nameAr: json["nameAr"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "nameEn": nameEn,
        "nameAr": nameAr,
    };
}

class Image {
    int id;
    String imageUrl;
    int productAttributesId;
    bool isDeleted;
    DateTime createdAt;
    DateTime updatedAt;

    Image({
        required this.id,
        required this.imageUrl,
        required this.productAttributesId,
        required this.isDeleted,
        required this.createdAt,
        required this.updatedAt,
    });

    Image copyWith({
        int? id,
        String? imageUrl,
        int? productAttributesId,
        bool? isDeleted,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Image(
            id: id ?? this.id,
            imageUrl: imageUrl ?? this.imageUrl,
            productAttributesId: productAttributesId ?? this.productAttributesId,
            isDeleted: isDeleted ?? this.isDeleted,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        imageUrl: json["imageUrl"],
        productAttributesId: json["productAttributesId"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "productAttributesId": productAttributesId,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Inventory {
    int id;
    int quantity;
    DateTime createdAt;
    DateTime updatedAt;
    bool isDeleted;

    Inventory({
        required this.id,
        required this.quantity,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
    });

    Inventory copyWith({
        int? id,
        int? quantity,
        DateTime? createdAt,
        DateTime? updatedAt,
        bool? isDeleted,
    }) => 
        Inventory(
            id: id ?? this.id,
            quantity: quantity ?? this.quantity,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            isDeleted: isDeleted ?? this.isDeleted,
        );

    factory Inventory.fromRawJson(String str) => Inventory.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        id: json["id"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
    };
}
