


import 'dart:convert';

class ConfirmPaymentResponseModel {
    String message;

    ConfirmPaymentResponseModel({
        required this.message,
    });

    ConfirmPaymentResponseModel copyWith({
        String? message,
    }) => 
        ConfirmPaymentResponseModel(
            message: message ?? this.message,
        );

    factory ConfirmPaymentResponseModel.fromRawJson(String str) => ConfirmPaymentResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ConfirmPaymentResponseModel.fromJson(Map<String, dynamic> json) => ConfirmPaymentResponseModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
