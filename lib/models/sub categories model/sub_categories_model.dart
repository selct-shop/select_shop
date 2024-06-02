import 'dart:convert';

class SubCategoriesOfMainCategoresModle {
    List<SubCategoriesResult> result;
    int statusCode;
    String message;

    SubCategoriesOfMainCategoresModle({
        required this.result,
        required this.statusCode,
        required this.message,
    });

    SubCategoriesOfMainCategoresModle copyWith({
        List<SubCategoriesResult>? result,
        int? statusCode,
        String? message,
    }) => 
        SubCategoriesOfMainCategoresModle(
            result: result ?? this.result,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
        );

    factory SubCategoriesOfMainCategoresModle.fromRawJson(String str) => SubCategoriesOfMainCategoresModle.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubCategoriesOfMainCategoresModle.fromJson(Map<String, dynamic> json) => SubCategoriesOfMainCategoresModle(
        result: List<SubCategoriesResult>.from(json["result"].map((x) => SubCategoriesResult.fromJson(x))),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "statusCode": statusCode,
        "message": message,
    };
}

class SubCategoriesResult {
    int id;
    String nameEn;
    String nameAr;
    dynamic image;
    String slug;
    DateTime createdAt;
    String createdBy;
    DateTime updatedAt;
    dynamic updatedBy;
    bool isDeleted;
    dynamic deletedBy;
    int parentId;
    List<dynamic> children;

    SubCategoriesResult({
        required this.id,
        required this.nameEn,
        required this.nameAr,
        required this.image,
        required this.slug,
        required this.createdAt,
        required this.createdBy,
        required this.updatedAt,
        required this.updatedBy,
        required this.isDeleted,
        required this.deletedBy,
        required this.parentId,
        required this.children,
    });

    SubCategoriesResult copyWith({
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
        List<dynamic>? children,
    }) => 
        SubCategoriesResult(
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
            children: children ?? this.children,
        );

    factory SubCategoriesResult.fromRawJson(String str) => SubCategoriesResult.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubCategoriesResult.fromJson(Map<String, dynamic> json) => SubCategoriesResult(
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
        children: List<dynamic>.from(json["children"].map((x) => x)),
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
        "children": List<dynamic>.from(children.map((x) => x)),
    };
}
