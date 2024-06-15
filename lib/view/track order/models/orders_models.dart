import 'dart:convert';

class OrdersModel {
    OrdersResult result;
    int statusCode;
    String message;

    OrdersModel({
        required this.result,
        required this.statusCode,
        required this.message,
    });

    OrdersModel copyWith({
        OrdersResult? result,
        int? statusCode,
        String? message,
    }) => 
        OrdersModel(
            result: result ?? this.result,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
        );

    factory OrdersModel.fromRawJson(String str) => OrdersModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        result: OrdersResult.fromJson(json["result"]),
        statusCode: json["statusCode"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "statusCode": statusCode,
        "message": message,
    };
}

class OrdersResult {
    List<Order> orders;
    int totalCount;

    OrdersResult({
        required this.orders,
        required this.totalCount,
    });

    OrdersResult copyWith({
        List<Order>? orders,
        int? totalCount,
    }) => 
        OrdersResult(
            orders: orders ?? this.orders,
            totalCount: totalCount ?? this.totalCount,
        );

    factory OrdersResult.fromRawJson(String str) => OrdersResult.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrdersResult.fromJson(Map<String, dynamic> json) => OrdersResult(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        totalCount: json["totalCount"],
    );

    Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "totalCount": totalCount,
    };
}

class Order {
    int id;
    int customerId;
    String orderCodeId;
    String total;
    dynamic discounted;
    DateTime createdAt;
    DateTime updatedAt;
    bool isDeleted;
    int paymentId;
    int addressId;
    dynamic usedCouponId;
    dynamic deliveryId;
    List<dynamic> orderItems;
    OrderAddress address;
    List<OrderTrack> orderTrack;
    Payment payment;
    Customer customer;

    Order({
        required this.id,
        required this.customerId,
        required this.orderCodeId,
        required this.total,
        required this.discounted,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
        required this.paymentId,
        required this.addressId,
        required this.usedCouponId,
        required this.deliveryId,
        required this.orderItems,
        required this.address,
        required this.orderTrack,
        required this.payment,
        required this.customer,
    });

    Order copyWith({
        int? id,
        int? customerId,
        String? orderCodeId,
        String? total,
        dynamic discounted,
        DateTime? createdAt,
        DateTime? updatedAt,
        bool? isDeleted,
        int? paymentId,
        int? addressId,
        dynamic usedCouponId,
        dynamic deliveryId,
        List<dynamic>? orderItems,
        OrderAddress? address,
        List<OrderTrack>? orderTrack,
        Payment? payment,
        Customer? customer,
    }) => 
        Order(
            id: id ?? this.id,
            customerId: customerId ?? this.customerId,
            orderCodeId: orderCodeId ?? this.orderCodeId,
            total: total ?? this.total,
            discounted: discounted ?? this.discounted,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            isDeleted: isDeleted ?? this.isDeleted,
            paymentId: paymentId ?? this.paymentId,
            addressId: addressId ?? this.addressId,
            usedCouponId: usedCouponId ?? this.usedCouponId,
            deliveryId: deliveryId ?? this.deliveryId,
            orderItems: orderItems ?? this.orderItems,
            address: address ?? this.address,
            orderTrack: orderTrack ?? this.orderTrack,
            payment: payment ?? this.payment,
            customer: customer ?? this.customer,
        );

    factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        customerId: json["customerId"],
        orderCodeId: json["orderCodeId"],
        total: json["total"],
        discounted: json["discounted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        paymentId: json["paymentId"],
        addressId: json["addressId"],
        usedCouponId: json["usedCouponId"],
        deliveryId: json["deliveryId"],
        orderItems: List<dynamic>.from(json["orderItems"].map((x) => x)),
        address: OrderAddress.fromJson(json["address"]),
        orderTrack: List<OrderTrack>.from(json["orderTrack"].map((x) => OrderTrack.fromJson(x))),
        payment: Payment.fromJson(json["payment"]),
        customer: Customer.fromJson(json["customer"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customerId": customerId,
        "orderCodeId": orderCodeId,
        "total": total,
        "discounted": discounted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
        "paymentId": paymentId,
        "addressId": addressId,
        "usedCouponId": usedCouponId,
        "deliveryId": deliveryId,
        "orderItems": List<dynamic>.from(orderItems.map((x) => x)),
        "address": address.toJson(),
        "orderTrack": List<dynamic>.from(orderTrack.map((x) => x.toJson())),
        "payment": payment.toJson(),
        "customer": customer.toJson(),
    };
}

class OrderAddress {
    int id;
    String recievername;
    String email;
    String phoneNumber;
    dynamic customerId;
    String addressOne;
    dynamic addressTwo;
    dynamic lat;
    dynamic lng;
    dynamic addressName;
    dynamic zipCode;
    DateTime createdAt;
    DateTime updatedAt;
    bool isDeleted;
    int cityId;

    OrderAddress({
        required this.id,
        required this.recievername,
        required this.email,
        required this.phoneNumber,
        required this.customerId,
        required this.addressOne,
        required this.addressTwo,
        required this.lat,
        required this.lng,
        required this.addressName,
        required this.zipCode,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
        required this.cityId,
    });

    OrderAddress copyWith({
        int? id,
        String? recievername,
        String? email,
        String? phoneNumber,
        dynamic customerId,
        String? addressOne,
        dynamic addressTwo,
        dynamic lat,
        dynamic lng,
        dynamic addressName,
        dynamic zipCode,
        DateTime? createdAt,
        DateTime? updatedAt,
        bool? isDeleted,
        int? cityId,
    }) => 
        OrderAddress(
            id: id ?? this.id,
            recievername: recievername ?? this.recievername,
            email: email ?? this.email,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            customerId: customerId ?? this.customerId,
            addressOne: addressOne ?? this.addressOne,
            addressTwo: addressTwo ?? this.addressTwo,
            lat: lat ?? this.lat,
            lng: lng ?? this.lng,
            addressName: addressName ?? this.addressName,
            zipCode: zipCode ?? this.zipCode,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            isDeleted: isDeleted ?? this.isDeleted,
            cityId: cityId ?? this.cityId,
        );

    factory OrderAddress.fromRawJson(String str) => OrderAddress.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderAddress.fromJson(Map<String, dynamic> json) => OrderAddress(
        id: json["id"],
        recievername: json["recievername"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        customerId: json["customerId"],
        addressOne: json["addressOne"],
        addressTwo: json["addressTwo"],
        lat: json["lat"],
        lng: json["lng"],
        addressName: json["addressName"],
        zipCode: json["ZipCode"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        cityId: json["cityId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "recievername": recievername,
        "email": email,
        "phoneNumber": phoneNumber,
        "customerId": customerId,
        "addressOne": addressOne,
        "addressTwo": addressTwo,
        "lat": lat,
        "lng": lng,
        "addressName": addressName,
        "ZipCode": zipCode,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
        "cityId": cityId,
    };
}

class Customer {
    int id;
    String name;
    dynamic email;
    dynamic gender;
    dynamic nationality;
    dynamic dob;
    String phoneNumber;
    dynamic phoneVerifiedAt;
    dynamic emailVerifiedAt;
    String password;
    DateTime createdAt;
    DateTime updatedAt;
    bool isDeleted;
    bool isBlocked;
    dynamic blockedBy;

    Customer({
        required this.id,
        required this.name,
        required this.email,
        required this.gender,
        required this.nationality,
        required this.dob,
        required this.phoneNumber,
        required this.phoneVerifiedAt,
        required this.emailVerifiedAt,
        required this.password,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
        required this.isBlocked,
        required this.blockedBy,
    });

    Customer copyWith({
        int? id,
        String? name,
        dynamic email,
        dynamic gender,
        dynamic nationality,
        dynamic dob,
        String? phoneNumber,
        dynamic phoneVerifiedAt,
        dynamic emailVerifiedAt,
        String? password,
        DateTime? createdAt,
        DateTime? updatedAt,
        bool? isDeleted,
        bool? isBlocked,
        dynamic blockedBy,
    }) => 
        Customer(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            gender: gender ?? this.gender,
            nationality: nationality ?? this.nationality,
            dob: dob ?? this.dob,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            phoneVerifiedAt: phoneVerifiedAt ?? this.phoneVerifiedAt,
            emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
            password: password ?? this.password,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            isDeleted: isDeleted ?? this.isDeleted,
            isBlocked: isBlocked ?? this.isBlocked,
            blockedBy: blockedBy ?? this.blockedBy,
        );

    factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        nationality: json["nationality"],
        dob: json["DOB"],
        phoneNumber: json["phoneNumber"],
        phoneVerifiedAt: json["phoneVerifiedAt"],
        emailVerifiedAt: json["emailVerifiedAt"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        isBlocked: json["isBlocked"],
        blockedBy: json["blockedBy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "nationality": nationality,
        "DOB": dob,
        "phoneNumber": phoneNumber,
        "phoneVerifiedAt": phoneVerifiedAt,
        "emailVerifiedAt": emailVerifiedAt,
        "password": password,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
        "isBlocked": isBlocked,
        "blockedBy": blockedBy,
    };
}

class OrderTrack {
    int id;
    int orderId;
    int statusId;
    String createdBy;
    dynamic assignee;
    dynamic assigneeInfo;
    DateTime createdAt;
    Status status;

    OrderTrack({
        required this.id,
        required this.orderId,
        required this.statusId,
        required this.createdBy,
        required this.assignee,
        required this.assigneeInfo,
        required this.createdAt,
        required this.status,
    });

    OrderTrack copyWith({
        int? id,
        int? orderId,
        int? statusId,
        String? createdBy,
        dynamic assignee,
        dynamic assigneeInfo,
        DateTime? createdAt,
        Status? status,
    }) => 
        OrderTrack(
            id: id ?? this.id,
            orderId: orderId ?? this.orderId,
            statusId: statusId ?? this.statusId,
            createdBy: createdBy ?? this.createdBy,
            assignee: assignee ?? this.assignee,
            assigneeInfo: assigneeInfo ?? this.assigneeInfo,
            createdAt: createdAt ?? this.createdAt,
            status: status ?? this.status,
        );

    factory OrderTrack.fromRawJson(String str) => OrderTrack.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderTrack.fromJson(Map<String, dynamic> json) => OrderTrack(
        id: json["id"],
        orderId: json["orderId"],
        statusId: json["statusId"],
        createdBy: json["createdBy"],
        assignee: json["assignee"],
        assigneeInfo: json["assigneeInfo"],
        createdAt: DateTime.parse(json["createdAt"]),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "orderId": orderId,
        "statusId": statusId,
        "createdBy": createdBy,
        "assignee": assignee,
        "assigneeInfo": assigneeInfo,
        "createdAt": createdAt.toIso8601String(),
        "status": status.toJson(),
    };
}

class Status {
    int id;
    String nameEn;
    String nameAr;
    int code;
    String? desc;

    Status({
        required this.id,
        required this.nameEn,
        required this.nameAr,
        required this.code,
        required this.desc,
    });

    Status copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        int? code,
        String? desc,
    }) => 
        Status(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            code: code ?? this.code,
            desc: desc ?? this.desc,
        );

    factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        nameEn: json["nameEn"],
        nameAr: json["nameAr"],
        code: json["code"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameEn": nameEn,
        "nameAr": nameAr,
        "code": code,
        "desc": desc,
    };
}

class Payment {
    int id;
    int orderId;
    String amount;
    dynamic statusId;
    int typeId;
    DateTime createdAt;
    DateTime updatedAt;
    bool isDeleted;
    List<PaymentTrack> paymentTrack;

    Payment({
        required this.id,
        required this.orderId,
        required this.amount,
        required this.statusId,
        required this.typeId,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
        required this.paymentTrack,
    });

    Payment copyWith({
        int? id,
        int? orderId,
        String? amount,
        dynamic statusId,
        int? typeId,
        DateTime? createdAt,
        DateTime? updatedAt,
        bool? isDeleted,
        List<PaymentTrack>? paymentTrack,
    }) => 
        Payment(
            id: id ?? this.id,
            orderId: orderId ?? this.orderId,
            amount: amount ?? this.amount,
            statusId: statusId ?? this.statusId,
            typeId: typeId ?? this.typeId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            isDeleted: isDeleted ?? this.isDeleted,
            paymentTrack: paymentTrack ?? this.paymentTrack,
        );

    factory Payment.fromRawJson(String str) => Payment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        orderId: json["orderId"],
        amount: json["amount"],
        statusId: json["statusId"],
        typeId: json["typeId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        paymentTrack: List<PaymentTrack>.from(json["paymentTrack"].map((x) => PaymentTrack.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "orderId": orderId,
        "amount": amount,
        "statusId": statusId,
        "typeId": typeId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
        "paymentTrack": List<dynamic>.from(paymentTrack.map((x) => x.toJson())),
    };
}

class PaymentTrack {
    int id;
    int statusId;
    int paymentId;
    DateTime createdAt;
    Status status;

    PaymentTrack({
        required this.id,
        required this.statusId,
        required this.paymentId,
        required this.createdAt,
        required this.status,
    });

    PaymentTrack copyWith({
        int? id,
        int? statusId,
        int? paymentId,
        DateTime? createdAt,
        Status? status,
    }) => 
        PaymentTrack(
            id: id ?? this.id,
            statusId: statusId ?? this.statusId,
            paymentId: paymentId ?? this.paymentId,
            createdAt: createdAt ?? this.createdAt,
            status: status ?? this.status,
        );

    factory PaymentTrack.fromRawJson(String str) => PaymentTrack.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PaymentTrack.fromJson(Map<String, dynamic> json) => PaymentTrack(
        id: json["id"],
        statusId: json["statusId"],
        paymentId: json["paymentId"],
        createdAt: DateTime.parse(json["createdAt"]),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "statusId": statusId,
        "paymentId": paymentId,
        "createdAt": createdAt.toIso8601String(),
        "status": status.toJson(),
    };
}
