import 'dart:convert';

class ProductCalculationsModel {
    CalculationsResult result;
    int statusCode;
    String message;

    ProductCalculationsModel({
        required this.result,
        required this.statusCode,
        required this.message,
    });

    ProductCalculationsModel copyWith({
        CalculationsResult? result,
        int? statusCode,
        String? message,
    }) => 
        ProductCalculationsModel(
            result: result ?? this.result,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
        );

    factory ProductCalculationsModel.fromRawJson(String str) => ProductCalculationsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductCalculationsModel.fromJson(Map<String, dynamic> json) => ProductCalculationsModel(
        result: CalculationsResult.fromJson(json["result"]),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class CalculationsResult {
    int totalReviews;
    int fiveStars;
    int fourStars;
    int threeStars;
    int twoStars;
    int oneStars;
    int averageRating;

    CalculationsResult({
        required this.totalReviews,
        required this.fiveStars,
        required this.fourStars,
        required this.threeStars,
        required this.twoStars,
        required this.oneStars,
        required this.averageRating,
    });

    CalculationsResult copyWith({
        int? totalReviews,
        int? fiveStars,
        int? fourStars,
        int? threeStars,
        int? twoStars,
        int? oneStars,
        int? averageRating,
    }) => 
        CalculationsResult(
            totalReviews: totalReviews ?? this.totalReviews,
            fiveStars: fiveStars ?? this.fiveStars,
            fourStars: fourStars ?? this.fourStars,
            threeStars: threeStars ?? this.threeStars,
            twoStars: twoStars ?? this.twoStars,
            oneStars: oneStars ?? this.oneStars,
            averageRating: averageRating ?? this.averageRating,
        );

    factory CalculationsResult.fromRawJson(String str) => CalculationsResult.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CalculationsResult.fromJson(Map<String, dynamic> json) => CalculationsResult(
        totalReviews: json["totalReviews"],
        fiveStars: json["fiveStars"],
        fourStars: json["fourStars"],
        threeStars: json["threeStars"],
        twoStars: json["twoStars"],
        oneStars: json["oneStars"],
        averageRating: json["averageRating"],
    );

    Map<String, dynamic> toJson() => {
        "totalReviews": totalReviews,
        "fiveStars": fiveStars,
        "fourStars": fourStars,
        "threeStars": threeStars,
        "twoStars": twoStars,
        "oneStars": oneStars,
        "averageRating": averageRating,
    };
}
