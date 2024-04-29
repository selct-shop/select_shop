

class CategoriesModle {
    CategoriesModle({
        required this.categoriesResult,
        required this.statusCode,
        required this.message,
    });

    final List<CategoriesResult> categoriesResult;
    static const String resultKey = "result";
    
    final int? statusCode;
    static const String statusCodeKey = "statusCode";
    
    final String? message;
    static const String messageKey = "message";
    

    CategoriesModle copyWith({
        List<CategoriesResult>? categoriesResult,
        int? statusCode,
        String? message,
    }) {
        return CategoriesModle(
            categoriesResult: categoriesResult ?? this.categoriesResult,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
        );
    }

    factory CategoriesModle.fromJson(Map<String, dynamic> json){ 
        return CategoriesModle(
            categoriesResult: json["result"] == null ? [] : List<CategoriesResult>.from(json["result"]!.map((x) => CategoriesResult.fromJson(x))),
            statusCode: json["statusCode"],
            message: json["message"],
        );
    }

    Map<String, dynamic> toJson() => {
        "result": categoriesResult.map((x) => x?.toJson()).toList(),
        "statusCode": statusCode,
        "message": message,
    };

    @override
    String toString(){
        return "$categoriesResult, $statusCode, $message, ";
    }
}

class CategoriesResult {
    CategoriesResult({
        required this.categoryId,
        required this.nameEn,
        required this.nameAr,
        required this.categoryImage,
        required this.slug,
        required this.createdAt,
        required this.createdBy,
        required this.updatedAt,
        required this.updatedBy,
        required this.isDeleted,
        required this.deletedBy,
        required this.parentId,
        required this.parent,
        required this.children,
        required this.products,
    });

    final int? categoryId;
    static const String idKey = "id";
    
    final String? nameEn;
    static const String nameEnKey = "nameEn";
    
    final String? nameAr;
    static const String nameArKey = "nameAr";
    
    final String? categoryImage;
    static const String imageKey = "image";
    
    final String? slug;
    static const String slugKey = "slug";
    
    final DateTime? createdAt;
    static const String createdAtKey = "createdAt";
    
    final String? createdBy;
    static const String createdByKey = "createdBy";
    
    final DateTime? updatedAt;
    static const String updatedAtKey = "updatedAt";
    
    final dynamic updatedBy;
    static const String updatedByKey = "updatedBy";
    
    final bool? isDeleted;
    static const String isDeletedKey = "isDeleted";
    
    final dynamic deletedBy;
    static const String deletedByKey = "deletedBy";
    
    final int? parentId;
    static const String parentIdKey = "parentId";
    
    final CategoriesResult? parent;
    static const String parentKey = "parent";
    
    final List<CategoriesResult> children;
    static const String childrenKey = "children";
    
    final List<dynamic> products;
    static const String productsKey = "products";
    

    CategoriesResult copyWith({
        int? categoryId,
        String? nameEn,
        String? nameAr,
        String? categoryImage,
        String? slug,
        DateTime? createdAt,
        String? createdBy,
        DateTime? updatedAt,
        dynamic? updatedBy,
        bool? isDeleted,
        dynamic? deletedBy,
        int? parentId,
        CategoriesResult? parent,
        List<CategoriesResult>? children,
        List<dynamic>? products,
    }) {
        return CategoriesResult(
            categoryId: categoryId ?? this.categoryId,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            categoryImage: categoryImage ?? this.categoryImage,
            slug: slug ?? this.slug,
            createdAt: createdAt ?? this.createdAt,
            createdBy: createdBy ?? this.createdBy,
            updatedAt: updatedAt ?? this.updatedAt,
            updatedBy: updatedBy ?? this.updatedBy,
            isDeleted: isDeleted ?? this.isDeleted,
            deletedBy: deletedBy ?? this.deletedBy,
            parentId: parentId ?? this.parentId,
            parent: parent ?? this.parent,
            children: children ?? this.children,
            products: products ?? this.products,
        );
    }

    factory CategoriesResult.fromJson(Map<String, dynamic> json){ 
        return CategoriesResult(
            categoryId: json["id"],
            nameEn: json["nameEn"],
            nameAr: json["nameAr"],
            categoryImage: json["image"],
            slug: json["slug"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            createdBy: json["createdBy"],
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            updatedBy: json["updatedBy"],
            isDeleted: json["isDeleted"],
            deletedBy: json["deletedBy"],
            parentId: json["parentId"],
            parent: json["parent"] == null ? null : CategoriesResult.fromJson(json["parent"]),
            children: json["children"] == null ? [] : List<CategoriesResult>.from(json["children"]!.map((x) => CategoriesResult.fromJson(x))),
            products: json["products"] == null ? [] : List<dynamic>.from(json["products"]!.map((x) => x)),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": categoryId,
        "nameEn": nameEn,
        "nameAr": nameAr,
        "image": categoryImage,
        "slug": slug,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "updatedAt": updatedAt?.toIso8601String(),
        "updatedBy": updatedBy,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "parentId": parentId,
        "parent": parent?.toJson(),
        "children": children.map((x) => x?.toJson()).toList(),
        "products": products.map((x) => x).toList(),
    };

    @override
    String toString(){
        return "$categoryId, $nameEn, $nameAr, $categoryImage, $slug, $createdAt, $createdBy, $updatedAt, $updatedBy, $isDeleted, $deletedBy, $parentId, $parent, $children, $products, ";
    }
}
