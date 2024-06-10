import 'dart:convert';

class PostOrderModel {
    int cartId;
    OrderAddress address;

    PostOrderModel({
        required this.cartId,
        required this.address,
    });

    PostOrderModel copyWith({
        int? cartId,
        OrderAddress? address,
    }) => 
        PostOrderModel(
            cartId: cartId ?? this.cartId,
            address: address ?? this.address,
        );

    factory PostOrderModel.fromRawJson(String str) => PostOrderModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PostOrderModel.fromJson(Map<String, dynamic> json) => PostOrderModel(
        cartId: json["cartId"],
        address: OrderAddress.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "cartId": cartId,
        "address": address.toJson(),
    };
}

class OrderAddress {
    String recievername;
    String email;
    String phoneNumber;
    String addressOne;
    int cityId;
    int paymentType;

    OrderAddress({
        required this.recievername,
        required this.email,
        required this.phoneNumber,
        required this.addressOne,
        required this.cityId,
        required this.paymentType,
    });

    OrderAddress copyWith({
        String? recievername,
        String? email,
        String? phoneNumber,
        String? addressOne,
        int? cityId,
        int? paymentType,
    }) => 
        OrderAddress(
            recievername: recievername ?? this.recievername,
            email: email ?? this.email,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            addressOne: addressOne ?? this.addressOne,
            cityId: cityId ?? this.cityId,
            paymentType: paymentType ?? this.paymentType,
        );

    factory OrderAddress.fromRawJson(String str) => OrderAddress.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderAddress.fromJson(Map<String, dynamic> json) => OrderAddress(
        recievername: json["recievername"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        addressOne: json["addressOne"],
        cityId: json["cityId"],
        paymentType: json["paymentType"],
    );

    Map<String, dynamic> toJson() => {
        "recievername": recievername,
        "email": email,
        "phoneNumber": phoneNumber,
        "addressOne": addressOne,
        "cityId": cityId,
        "paymentType": paymentType,
    };
}
