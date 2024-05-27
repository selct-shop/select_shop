import 'dart:convert';

class GetCollectionModel {
    CollectionResult result;
    int statusCode;
    String message;

    GetCollectionModel({
        required this.result,
        required this.statusCode,
        required this.message,
    });

    GetCollectionModel copyWith({
        CollectionResult? result,
        int? statusCode,
        String? message,
    }) => 
        GetCollectionModel(
            result: result ?? this.result,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
        );

    factory GetCollectionModel.fromRawJson(String str) => GetCollectionModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCollectionModel.fromJson(Map<String, dynamic> json) => GetCollectionModel(
        result: CollectionResult.fromJson(json["result"]),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class CollectionResult {
    List<Product> products;
    int totalCount;

    CollectionResult({
        required this.products,
        required this.totalCount,
    });

    CollectionResult copyWith({
        List<Product>? products,
        int? totalCount,
    }) => 
        CollectionResult(
            products: products ?? this.products,
            totalCount: totalCount ?? this.totalCount,
        );

    factory CollectionResult.fromRawJson(String str) => CollectionResult.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CollectionResult.fromJson(Map<String, dynamic> json) => CollectionResult(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        totalCount: json["totalCount"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "totalCount": totalCount,
    };
}

class Product {
    int id;
    String nameEn;
    String nameAr;
    String descriptionEn;
    String descriptionAr;
    String price;
    String compareToPrice;
    int brandId;
    bool isDeleted;
    dynamic deletedBy;
    DateTime createdAt;
    String createdBy;
    DateTime updatedAt;
    dynamic updatedBy;
    bool isApproved;
    String approvedBy;
    String slug;
    dynamic sku;
    String tags;
    String mainImages;
    int productActivityId;
    dynamic guide;
    String productType;
    Brand brand;
    List<CategoryElement> categories;
    List<ProductStatus> productStatus;
    List<ProductAttribute> productAttributes;

    Product({
        required this.id,
        required this.nameEn,
        required this.nameAr,
        required this.descriptionEn,
        required this.descriptionAr,
        required this.price,
        required this.compareToPrice,
        required this.brandId,
        required this.isDeleted,
        required this.deletedBy,
        required this.createdAt,
        required this.createdBy,
        required this.updatedAt,
        required this.updatedBy,
        required this.isApproved,
        required this.approvedBy,
        required this.slug,
        required this.sku,
        required this.tags,
        required this.mainImages,
        required this.productActivityId,
        required this.guide,
        required this.productType,
        required this.brand,
        required this.categories,
        required this.productStatus,
        required this.productAttributes,
    });

    Product copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? descriptionEn,
        String? descriptionAr,
        String? price,
        String? compareToPrice,
        int? brandId,
        bool? isDeleted,
        dynamic deletedBy,
        DateTime? createdAt,
        String? createdBy,
        DateTime? updatedAt,
        dynamic updatedBy,
        bool? isApproved,
        String? approvedBy,
        String? slug,
        dynamic sku,
        String? tags,
        String? mainImages,
        int? productActivityId,
        dynamic guide,
        String? productType,
        Brand? brand,
        List<CategoryElement>? categories,
        List<ProductStatus>? productStatus,
        List<ProductAttribute>? productAttributes,
    }) => 
        Product(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            descriptionEn: descriptionEn ?? this.descriptionEn,
            descriptionAr: descriptionAr ?? this.descriptionAr,
            price: price ?? this.price,
            compareToPrice: compareToPrice ?? this.compareToPrice,
            brandId: brandId ?? this.brandId,
            isDeleted: isDeleted ?? this.isDeleted,
            deletedBy: deletedBy ?? this.deletedBy,
            createdAt: createdAt ?? this.createdAt,
            createdBy: createdBy ?? this.createdBy,
            updatedAt: updatedAt ?? this.updatedAt,
            updatedBy: updatedBy ?? this.updatedBy,
            isApproved: isApproved ?? this.isApproved,
            approvedBy: approvedBy ?? this.approvedBy,
            slug: slug ?? this.slug,
            sku: sku ?? this.sku,
            tags: tags ?? this.tags,
            mainImages: mainImages ?? this.mainImages,
            productActivityId: productActivityId ?? this.productActivityId,
            guide: guide ?? this.guide,
            productType: productType ?? this.productType,
            brand: brand ?? this.brand,
            categories: categories ?? this.categories,
            productStatus: productStatus ?? this.productStatus,
            productAttributes: productAttributes ?? this.productAttributes,
        );

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nameEn: json["nameEn"],
        nameAr: json["nameAr"],
        descriptionEn: json["descriptionEn"],
        descriptionAr: json["descriptionAr"],
        price: json["price"],
        compareToPrice: json["compareToPrice"],
        brandId: json["brandId"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        updatedBy: json["updatedBy"],
        isApproved: json["isApproved"],
        approvedBy: json["approvedBy"],
        slug: json["slug"],
        sku: json["sku"],
        tags: json["tags"],
        mainImages: json["mainImages"],
        productActivityId: json["productActivityId"],
        guide: json["guide"],
        productType: json["productType"],
        brand: Brand.fromJson(json["brand"]),
        categories: List<CategoryElement>.from(json["categories"].map((x) => CategoryElement.fromJson(x))),
        productStatus: List<ProductStatus>.from(json["productStatus"].map((x) => ProductStatus.fromJson(x))),
        productAttributes: List<ProductAttribute>.from(json["productAttributes"].map((x) => ProductAttribute.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameEn": nameEn,
        "nameAr": nameAr,
        "descriptionEn": descriptionEn,
        "descriptionAr": descriptionAr,
        "price": price,
        "compareToPrice": compareToPrice,
        "brandId": brandId,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "createdAt": createdAt.toIso8601String(),
        "createdBy": createdBy,
        "updatedAt": updatedAt.toIso8601String(),
        "updatedBy": updatedBy,
        "isApproved": isApproved,
        "approvedBy": approvedBy,
        "slug": slug,
        "sku": sku,
        "tags": tags,
        "mainImages": mainImages,
        "productActivityId": productActivityId,
        "guide": guide,
        "productType": productType,
        "brand": brand.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "productStatus": List<dynamic>.from(productStatus.map((x) => x.toJson())),
        "productAttributes": List<dynamic>.from(productAttributes.map((x) => x.toJson())),
    };
}

class Brand {
    int id;
    String nameEn;
    String nameAr;
    String descriptionAr;
    String descriptionEn;
    dynamic slug;
    String image;
    int merchantId;
    DateTime createdAt;
    DateTime updatedAt;
    String createdBy;
    dynamic updatedBy;
    dynamic deletedBy;
    bool isDeleted;
    int activityId;

    Brand({
        required this.id,
        required this.nameEn,
        required this.nameAr,
        required this.descriptionAr,
        required this.descriptionEn,
        required this.slug,
        required this.image,
        required this.merchantId,
        required this.createdAt,
        required this.updatedAt,
        required this.createdBy,
        required this.updatedBy,
        required this.deletedBy,
        required this.isDeleted,
        required this.activityId,
    });

    Brand copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? descriptionAr,
        String? descriptionEn,
        dynamic slug,
        String? image,
        int? merchantId,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? createdBy,
        dynamic updatedBy,
        dynamic deletedBy,
        bool? isDeleted,
        int? activityId,
    }) => 
        Brand(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            descriptionAr: descriptionAr ?? this.descriptionAr,
            descriptionEn: descriptionEn ?? this.descriptionEn,
            slug: slug ?? this.slug,
            image: image ?? this.image,
            merchantId: merchantId ?? this.merchantId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            createdBy: createdBy ?? this.createdBy,
            updatedBy: updatedBy ?? this.updatedBy,
            deletedBy: deletedBy ?? this.deletedBy,
            isDeleted: isDeleted ?? this.isDeleted,
            activityId: activityId ?? this.activityId,
        );

    factory Brand.fromRawJson(String str) => Brand.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        nameEn: json["nameEn"],
        nameAr: json["nameAr"],
        descriptionAr: json["descriptionAr"],
        descriptionEn: json["descriptionEn"],
        slug: json["slug"],
        image: json["image"],
        merchantId: json["merchantId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        deletedBy: json["deletedBy"],
        isDeleted: json["isDeleted"],
        activityId: json["activityId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameEn": nameEn,
        "nameAr": nameAr,
        "descriptionAr": descriptionAr,
        "descriptionEn": descriptionEn,
        "slug": slug,
        "image": image,
        "merchantId": merchantId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "deletedBy": deletedBy,
        "isDeleted": isDeleted,
        "activityId": activityId,
    };
}

class CategoryElement {
    ProductPropNameClass category;

    CategoryElement({
        required this.category,
    });

    CategoryElement copyWith({
        ProductPropNameClass? category,
    }) => 
        CategoryElement(
            category: category ?? this.category,
        );

    factory CategoryElement.fromRawJson(String str) => CategoryElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
        category: ProductPropNameClass.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "category": category.toJson(),
    };
}

class ProductPropNameClass {
    int id;
    String nameEn;
    String nameAr;
    dynamic image;
    String? slug;
    DateTime createdAt;
    String createdBy;
    DateTime updatedAt;
    dynamic updatedBy;
    bool isDeleted;
    dynamic deletedBy;
    int? parentId;
    String? unitEn;
    String? unitAr;
    dynamic defaultValues;

    ProductPropNameClass({
        required this.id,
        required this.nameEn,
        required this.nameAr,
        this.image,
        this.slug,
        required this.createdAt,
        required this.createdBy,
        required this.updatedAt,
        required this.updatedBy,
        required this.isDeleted,
        required this.deletedBy,
        this.parentId,
        this.unitEn,
        this.unitAr,
        this.defaultValues,
    });

    ProductPropNameClass copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        dynamic image,
        String? slug,
        DateTime? createdAt,
        String? createdBy,
        DateTime? updatedAt,
        dynamic updatedBy,
        bool? isDeleted,
        dynamic deletedBy,
        int? parentId,
        String? unitEn,
        String? unitAr,
        dynamic defaultValues,
    }) => 
        ProductPropNameClass(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            image: image ?? this.image,
            slug: slug ?? this.slug,
            createdAt: createdAt ?? this.createdAt,
            createdBy: createdBy ?? this.createdBy,
            updatedAt: updatedAt ?? this.updatedAt,
            updatedBy: updatedBy ?? this.updatedBy,
            isDeleted: isDeleted ?? this.isDeleted,
            deletedBy: deletedBy ?? this.deletedBy,
            parentId: parentId ?? this.parentId,
            unitEn: unitEn ?? this.unitEn,
            unitAr: unitAr ?? this.unitAr,
            defaultValues: defaultValues ?? this.defaultValues,
        );

    factory ProductPropNameClass.fromRawJson(String str) => ProductPropNameClass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductPropNameClass.fromJson(Map<String, dynamic> json) => ProductPropNameClass(
        id: json["id"],
        nameEn: json["nameEn"],
        nameAr: json["nameAr"],
        image: json["image"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        updatedBy: json["updatedBy"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        parentId: json["parentId"],
        unitEn: json["unitEn"],
        unitAr: json["unitAr"],
        defaultValues: json["defaultValues"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameEn": nameEn,
        "nameAr": nameAr,
        "image": image,
        "slug": slug,
        "createdAt": createdAt.toIso8601String(),
        "createdBy": createdBy,
        "updatedAt": updatedAt.toIso8601String(),
        "updatedBy": updatedBy,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "parentId": parentId,
        "unitEn": unitEn,
        "unitAr": unitAr,
        "defaultValues": defaultValues,
    };
}

class ProductAttribute {
    int id;
    int productId;
    int propValueId;
    int colorId;
    int inventoryId;
    bool isDeleted;
    dynamic deletedBy;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic updatedBy;
    List<Image> images;
    PropValue propValue;
    Color color;
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
        required this.propValue,
        required this.color,
        required this.inventory,
    });

    ProductAttribute copyWith({
        int? id,
        int? productId,
        int? propValueId,
        int? colorId,
        int? inventoryId,
        bool? isDeleted,
        dynamic deletedBy,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic updatedBy,
        List<Image>? images,
        PropValue? propValue,
        Color? color,
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
            propValue: propValue ?? this.propValue,
            color: color ?? this.color,
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
        propValue: PropValue.fromJson(json["propValue"]),
        color: Color.fromJson(json["color"]),
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
        "propValue": propValue.toJson(),
        "color": color.toJson(),
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
    dynamic productId;

    Image({
        required this.id,
        required this.imageUrl,
        required this.productAttributesId,
        required this.isDeleted,
        required this.createdAt,
        required this.updatedAt,
        required this.productId,
    });

    Image copyWith({
        int? id,
        String? imageUrl,
        int? productAttributesId,
        bool? isDeleted,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic productId,
    }) => 
        Image(
            id: id ?? this.id,
            imageUrl: imageUrl ?? this.imageUrl,
            productAttributesId: productAttributesId ?? this.productAttributesId,
            isDeleted: isDeleted ?? this.isDeleted,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            productId: productId ?? this.productId,
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
        productId: json["productId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "productAttributesId": productAttributesId,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "productId": productId,
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

class PropValue {
    int id;
    String value;
    int productPropNameId;
    ProductPropNameClass productPropName;

    PropValue({
        required this.id,
        required this.value,
        required this.productPropNameId,
        required this.productPropName,
    });

    PropValue copyWith({
        int? id,
        String? value,
        int? productPropNameId,
        ProductPropNameClass? productPropName,
    }) => 
        PropValue(
            id: id ?? this.id,
            value: value ?? this.value,
            productPropNameId: productPropNameId ?? this.productPropNameId,
            productPropName: productPropName ?? this.productPropName,
        );

    factory PropValue.fromRawJson(String str) => PropValue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PropValue.fromJson(Map<String, dynamic> json) => PropValue(
        id: json["id"],
        value: json["value"],
        productPropNameId: json["productPropNameId"],
        productPropName: ProductPropNameClass.fromJson(json["productPropName"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "productPropNameId": productPropNameId,
        "productPropName": productPropName.toJson(),
    };
}

class ProductStatus {
    int id;
    String status;
    DateTime createdAt;
    int productId;
    bool isDeleted;

    ProductStatus({
        required this.id,
        required this.status,
        required this.createdAt,
        required this.productId,
        required this.isDeleted,
    });

    ProductStatus copyWith({
        int? id,
        String? status,
        DateTime? createdAt,
        int? productId,
        bool? isDeleted,
    }) => 
        ProductStatus(
            id: id ?? this.id,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            productId: productId ?? this.productId,
            isDeleted: isDeleted ?? this.isDeleted,
        );

    factory ProductStatus.fromRawJson(String str) => ProductStatus.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductStatus.fromJson(Map<String, dynamic> json) => ProductStatus(
        id: json["id"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        productId: json["productId"],
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "productId": productId,
        "isDeleted": isDeleted,
    };
}
