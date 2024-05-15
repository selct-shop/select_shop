


import 'dart:convert';

class GetAllEmirates {
    Result result;
    int statusCode;
    String message;

    GetAllEmirates({
        required this.result,
        required this.statusCode,
        required this.message,
    });

    GetAllEmirates copyWith({
        Result? result,
        int? statusCode,
        String? message,
    }) => 
        GetAllEmirates(
            result: result ?? this.result,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
        );

    factory GetAllEmirates.fromRawJson(String str) => GetAllEmirates.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetAllEmirates.fromJson(Map<String, dynamic> json) => GetAllEmirates(
        result: Result.fromJson(json["result"]),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class Result {
    List<AddressCity> addressCities;

    Result({
        required this.addressCities,
    });

    Result copyWith({
        List<AddressCity>? addressCities,
    }) => 
        Result(
            addressCities: addressCities ?? this.addressCities,
        );

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressCities: List<AddressCity>.from(json["addressCities"].map((x) => AddressCity.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "addressCities": List<dynamic>.from(addressCities.map((x) => x.toJson())),
    };
}

class AddressCity {
    int id;
    String nameEn;
    String nameAr;
    DateTime createdAt;
    DateTime updatedAt;
    bool isDeleted;

    AddressCity({
        required this.id,
        required this.nameEn,
        required this.nameAr,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
    });

    AddressCity copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        DateTime? createdAt,
        DateTime? updatedAt,
        bool? isDeleted,
    }) => 
        AddressCity(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            isDeleted: isDeleted ?? this.isDeleted,
        );

    factory AddressCity.fromRawJson(String str) => AddressCity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AddressCity.fromJson(Map<String, dynamic> json) => AddressCity(
        id: json["id"],
        nameEn: json["nameEn"],
        nameAr: json["nameAr"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameEn": nameEn,
        "nameAr": nameAr,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
    };
}
