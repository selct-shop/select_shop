import 'dart:convert';

class PostOrderResponseModel {
    Result result;
    int statusCode;
    String message;

    PostOrderResponseModel({
        required this.result,
        required this.statusCode,
        required this.message,
    });

    PostOrderResponseModel copyWith({
        Result? result,
        int? statusCode,
        String? message,
    }) => 
        PostOrderResponseModel(
            result: result ?? this.result,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
        );

    factory PostOrderResponseModel.fromRawJson(String str) => PostOrderResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PostOrderResponseModel.fromJson(Map<String, dynamic> json) => PostOrderResponseModel(
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
    Order order;

    Result({
        required this.order,
    });

    Result copyWith({
        Order? order,
    }) => 
        Result(
            order: order ?? this.order,
        );

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        order: Order.fromJson(json["order"]),
    );

    Map<String, dynamic> toJson() => {
        "order": order.toJson(),
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
    List<OrderItem> orderItems;
    Address address;
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
        List<OrderItem>? orderItems,
        Address? address,
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
        orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
        address: Address.fromJson(json["address"]),
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
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
        "address": address.toJson(),
        "orderTrack": List<dynamic>.from(orderTrack.map((x) => x.toJson())),
        "payment": payment.toJson(),
        "customer": customer.toJson(),
    };
}

class Address {
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

    Address({
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

    Address copyWith({
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
        Address(
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

    factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Address.fromJson(Map<String, dynamic> json) => Address(
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

class OrderItem {
    int id;
    int orderId;
    int productId;
    int quantity;
    String price;
    DateTime createdAt;
    DateTime updatedAt;
    bool isDeleted;
    bool confirmed;
    dynamic confirmedBy;
    OrderItemProduct product;

    OrderItem({
        required this.id,
        required this.orderId,
        required this.productId,
        required this.quantity,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
        required this.confirmed,
        required this.confirmedBy,
        required this.product,
    });

    OrderItem copyWith({
        int? id,
        int? orderId,
        int? productId,
        int? quantity,
        String? price,
        DateTime? createdAt,
        DateTime? updatedAt,
        bool? isDeleted,
        bool? confirmed,
        dynamic confirmedBy,
        OrderItemProduct? product,
    }) => 
        OrderItem(
            id: id ?? this.id,
            orderId: orderId ?? this.orderId,
            productId: productId ?? this.productId,
            quantity: quantity ?? this.quantity,
            price: price ?? this.price,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            isDeleted: isDeleted ?? this.isDeleted,
            confirmed: confirmed ?? this.confirmed,
            confirmedBy: confirmedBy ?? this.confirmedBy,
            product: product ?? this.product,
        );

    factory OrderItem.fromRawJson(String str) => OrderItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        orderId: json["orderId"],
        productId: json["productId"],
        quantity: json["quantity"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        confirmed: json["confirmed"],
        confirmedBy: json["confirmedBy"],
        product: OrderItemProduct.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "orderId": orderId,
        "productId": productId,
        "quantity": quantity,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
        "confirmed": confirmed,
        "confirmedBy": confirmedBy,
        "product": product.toJson(),
    };
}

class OrderItemProduct {
    int id;
    int productId;
    int propValueId;
    dynamic colorId;
    int inventoryId;
    bool isDeleted;
    dynamic deletedBy;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic updatedBy;
    ProductProduct product;
    List<Image> images;
    dynamic color;
    PropValue propValue;
    Inventory inventory;

    OrderItemProduct({
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
        required this.product,
        required this.images,
        required this.color,
        required this.propValue,
        required this.inventory,
    });

    OrderItemProduct copyWith({
        int? id,
        int? productId,
        int? propValueId,
        dynamic colorId,
        int? inventoryId,
        bool? isDeleted,
        dynamic deletedBy,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic updatedBy,
        ProductProduct? product,
        List<Image>? images,
        dynamic color,
        PropValue? propValue,
        Inventory? inventory,
    }) => 
        OrderItemProduct(
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
            product: product ?? this.product,
            images: images ?? this.images,
            color: color ?? this.color,
            propValue: propValue ?? this.propValue,
            inventory: inventory ?? this.inventory,
        );

    factory OrderItemProduct.fromRawJson(String str) => OrderItemProduct.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderItemProduct.fromJson(Map<String, dynamic> json) => OrderItemProduct(
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
        product: ProductProduct.fromJson(json["product"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        color: json["color"],
        propValue: PropValue.fromJson(json["propValue"]),
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
        "product": product.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "color": color,
        "propValue": propValue.toJson(),
        "inventory": inventory.toJson(),
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

class ProductProduct {
    int id;
    String nameEn;
    String nameAr;
    String descriptionEn;
    String descriptionAr;
    String price;
    String? compareToPrice;
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
    List<dynamic> review;
    Brand brand;

    ProductProduct({
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
        required this.review,
        required this.brand,
    });

    ProductProduct copyWith({
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
        List<dynamic>? review,
        Brand? brand,
    }) => 
        ProductProduct(
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
            review: review ?? this.review,
            brand: brand ?? this.brand,
        );

    factory ProductProduct.fromRawJson(String str) => ProductProduct.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
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
        review: List<dynamic>.from(json["review"].map((x) => x)),
        brand: Brand.fromJson(json["brand"]),
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
        "review": List<dynamic>.from(review.map((x) => x)),
        "brand": brand.toJson(),
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
    Merchant merchant;

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
        required this.merchant,
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
        Merchant? merchant,
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
            merchant: merchant ?? this.merchant,
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
        merchant: Merchant.fromJson(json["merchant"]),
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
        "merchant": merchant.toJson(),
    };
}

class Merchant {
    int id;
    String nameEn;
    String nameAr;
    String storeNameEn;
    String storeNameAr;
    String buisnessCategory;
    String message;
    String phoneNumber;
    String email;
    dynamic phoneNumVerifiedAt;
    dynamic emailVerifiedAt;
    String password;
    DateTime createdAt;
    DateTime updatedAt;
    String createdBy;
    dynamic updatedBy;
    bool isDeleted;
    dynamic deletedBy;
    String background;
    dynamic backgroundColor;
    String storeLogo;
    String storeSlogan;
    int activityId;
    String role;
    List<dynamic> storeReviews;

    Merchant({
        required this.id,
        required this.nameEn,
        required this.nameAr,
        required this.storeNameEn,
        required this.storeNameAr,
        required this.buisnessCategory,
        required this.message,
        required this.phoneNumber,
        required this.email,
        required this.phoneNumVerifiedAt,
        required this.emailVerifiedAt,
        required this.password,
        required this.createdAt,
        required this.updatedAt,
        required this.createdBy,
        required this.updatedBy,
        required this.isDeleted,
        required this.deletedBy,
        required this.background,
        required this.backgroundColor,
        required this.storeLogo,
        required this.storeSlogan,
        required this.activityId,
        required this.role,
        required this.storeReviews,
    });

    Merchant copyWith({
        int? id,
        String? nameEn,
        String? nameAr,
        String? storeNameEn,
        String? storeNameAr,
        String? buisnessCategory,
        String? message,
        String? phoneNumber,
        String? email,
        dynamic phoneNumVerifiedAt,
        dynamic emailVerifiedAt,
        String? password,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? createdBy,
        dynamic updatedBy,
        bool? isDeleted,
        dynamic deletedBy,
        String? background,
        dynamic backgroundColor,
        String? storeLogo,
        String? storeSlogan,
        int? activityId,
        String? role,
        List<dynamic>? storeReviews,
    }) => 
        Merchant(
            id: id ?? this.id,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            storeNameEn: storeNameEn ?? this.storeNameEn,
            storeNameAr: storeNameAr ?? this.storeNameAr,
            buisnessCategory: buisnessCategory ?? this.buisnessCategory,
            message: message ?? this.message,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            email: email ?? this.email,
            phoneNumVerifiedAt: phoneNumVerifiedAt ?? this.phoneNumVerifiedAt,
            emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
            password: password ?? this.password,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            createdBy: createdBy ?? this.createdBy,
            updatedBy: updatedBy ?? this.updatedBy,
            isDeleted: isDeleted ?? this.isDeleted,
            deletedBy: deletedBy ?? this.deletedBy,
            background: background ?? this.background,
            backgroundColor: backgroundColor ?? this.backgroundColor,
            storeLogo: storeLogo ?? this.storeLogo,
            storeSlogan: storeSlogan ?? this.storeSlogan,
            activityId: activityId ?? this.activityId,
            role: role ?? this.role,
            storeReviews: storeReviews ?? this.storeReviews,
        );

    factory Merchant.fromRawJson(String str) => Merchant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        id: json["id"],
        nameEn: json["nameEn"],
        nameAr: json["nameAr"],
        storeNameEn: json["storeNameEn"],
        storeNameAr: json["storeNameAr"],
        buisnessCategory: json["buisnessCategory"],
        message: json["message"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        phoneNumVerifiedAt: json["phoneNumVerifiedAt"],
        emailVerifiedAt: json["emailVerifiedAt"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        background: json["background"],
        backgroundColor: json["backgroundColor"],
        storeLogo: json["storeLogo"],
        storeSlogan: json["storeSlogan"],
        activityId: json["activityId"],
        role: json["role"],
        storeReviews: List<dynamic>.from(json["storeReviews"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameEn": nameEn,
        "nameAr": nameAr,
        "storeNameEn": storeNameEn,
        "storeNameAr": storeNameAr,
        "buisnessCategory": buisnessCategory,
        "message": message,
        "phoneNumber": phoneNumber,
        "email": email,
        "phoneNumVerifiedAt": phoneNumVerifiedAt,
        "emailVerifiedAt": emailVerifiedAt,
        "password": password,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "background": background,
        "backgroundColor": backgroundColor,
        "storeLogo": storeLogo,
        "storeSlogan": storeSlogan,
        "activityId": activityId,
        "role": role,
        "storeReviews": List<dynamic>.from(storeReviews.map((x) => x)),
    };
}

class PropValue {
    int id;
    String value;
    int productPropNameId;

    PropValue({
        required this.id,
        required this.value,
        required this.productPropNameId,
    });

    PropValue copyWith({
        int? id,
        String? value,
        int? productPropNameId,
    }) => 
        PropValue(
            id: id ?? this.id,
            value: value ?? this.value,
            productPropNameId: productPropNameId ?? this.productPropNameId,
        );

    factory PropValue.fromRawJson(String str) => PropValue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PropValue.fromJson(Map<String, dynamic> json) => PropValue(
        id: json["id"],
        value: json["value"],
        productPropNameId: json["productPropNameId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "productPropNameId": productPropNameId,
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
