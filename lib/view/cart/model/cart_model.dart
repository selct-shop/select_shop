import 'dart:convert';

class CartModel {
  CartResult result;
  int statusCode;
  String message;

  CartModel({
    required this.result,
    required this.statusCode,
    required this.message,
  });

  CartModel copyWith({
    CartResult? result,
    int? statusCode,
    String? message,
  }) =>
      CartModel(
        result: result ?? this.result,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
      );

  factory CartModel.fromRawJson(String str) =>
      CartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        result: CartResult.fromJson(json["result"]),
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "statusCode": statusCode,
        "message": message,
      };
}

class CartResult {
  Cart cart;

  CartResult({
    required this.cart,
  });

  CartResult copyWith({
    Cart? cart,
  }) =>
      CartResult(
        cart: cart ?? this.cart,
      );

  factory CartResult.fromRawJson(String str) =>
      CartResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartResult.fromJson(Map<String, dynamic> json) => CartResult(
        cart: Cart.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "cart": cart.toJson(),
      };
}

class Cart {
  int id;
  int customerId;
  String cookieId;
  String total;
  DateTime createdAt;
  DateTime updatedAt;
  bool isDeleted;
  List<CartItem> cartItems;

  Cart({
    required this.id,
    required this.customerId,
    required this.cookieId,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.cartItems,
  });

  Cart copyWith({
    int? id,
    int? customerId,
    String? cookieId,
    String? total,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    List<CartItem>? cartItems,
  }) =>
      Cart(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        cookieId: cookieId ?? this.cookieId,
        total: total ?? this.total,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        cartItems: cartItems ?? this.cartItems,
      );

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        customerId: json["customerId"],
        cookieId: json["cookieId"],
        total: json["total"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        cartItems: List<CartItem>.from(
            json["cartItems"].map((x) => CartItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerId": customerId,
        "cookieId": cookieId,
        "total": total,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
        "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
      };
}

class CartItem {
  int id;
  int cartId;
  int productAttributeId;
  int quantity;
  String price;
  DateTime createdAt;
  DateTime updatedAt;
  bool isDeleted;
  ProductAttribute productAttribute;

  CartItem({
    required this.id,
    required this.cartId,
    required this.productAttributeId,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.productAttribute,
  });

  CartItem copyWith({
    int? id,
    int? cartId,
    int? productAttributeId,
    int? quantity,
    String? price,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    ProductAttribute? productAttribute,
  }) =>
      CartItem(
        id: id ?? this.id,
        cartId: cartId ?? this.cartId,
        productAttributeId: productAttributeId ?? this.productAttributeId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        productAttribute: productAttribute ?? this.productAttribute,
      );

  factory CartItem.fromRawJson(String str) =>
      CartItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        cartId: json["cartId"],
        productAttributeId: json["productAttributeId"],
        quantity: json["quantity"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        productAttribute: ProductAttribute.fromJson(json["productAttribute"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cartId": cartId,
        "productAttributeId": productAttributeId,
        "quantity": quantity,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
        "productAttribute": productAttribute.toJson(),
      };
}

class ProductAttribute {
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
  CartProduct product;
  dynamic color;
  PropValue propValue;
  List<ImageCartProduct> images;

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
    required this.product,
    required this.color,
    required this.propValue,
    required this.images,
  });

  ProductAttribute copyWith({
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
    CartProduct? product,
    dynamic color,
    PropValue? propValue,
    List<ImageCartProduct>? images,
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
        product: product ?? this.product,
        color: color ?? this.color,
        propValue: propValue ?? this.propValue,
        images: images ?? this.images,
      );

  factory ProductAttribute.fromRawJson(String str) =>
      ProductAttribute.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      ProductAttribute(
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
        product: CartProduct.fromJson(json["product"]),
        color: json["color"],
        propValue: PropValue.fromJson(json["propValue"]),
        images: List<ImageCartProduct>.from(
            json["images"].map((x) => ImageCartProduct.fromJson(x))),
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
        "color": color,
        "propValue": propValue.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class ImageCartProduct {
  int id;
  String imageUrl;
  int productAttributesId;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic productId;

  ImageCartProduct({
    required this.id,
    required this.imageUrl,
    required this.productAttributesId,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.productId,
  });

  ImageCartProduct copyWith({
    int? id,
    String? imageUrl,
    int? productAttributesId,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic productId,
  }) =>
      ImageCartProduct(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        productAttributesId: productAttributesId ?? this.productAttributesId,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        productId: productId ?? this.productId,
      );

  factory ImageCartProduct.fromRawJson(String str) =>
      ImageCartProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageCartProduct.fromJson(Map<String, dynamic> json) =>
      ImageCartProduct(
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

class CartProduct {
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
  Brand brand;

  CartProduct({
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
  });

  CartProduct copyWith({
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
  }) =>
      CartProduct(
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
      );

  factory CartProduct.fromRawJson(String str) =>
      CartProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
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
      );

  factory Merchant.fromRawJson(String str) =>
      Merchant.fromJson(json.decode(str));

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
      };
}

class PropValue {
  int id;
  String value;
  int productPropNameId;
  ProductPropName productPropName;

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
    ProductPropName? productPropName,
  }) =>
      PropValue(
        id: id ?? this.id,
        value: value ?? this.value,
        productPropNameId: productPropNameId ?? this.productPropNameId,
        productPropName: productPropName ?? this.productPropName,
      );

  factory PropValue.fromRawJson(String str) =>
      PropValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PropValue.fromJson(Map<String, dynamic> json) => PropValue(
        id: json["id"],
        value: json["value"],
        productPropNameId: json["productPropNameId"],
        productPropName: ProductPropName.fromJson(json["productPropName"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "productPropNameId": productPropNameId,
        "productPropName": productPropName.toJson(),
      };
}

class ProductPropName {
  int id;
  String nameEn;
  String nameAr;
  String unitEn;
  String unitAr;
  dynamic defaultValues;
  bool isDeleted;
  dynamic deletedBy;
  DateTime createdAt;
  String createdBy;
  DateTime updatedAt;
  dynamic updatedBy;

  ProductPropName({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.unitEn,
    required this.unitAr,
    required this.defaultValues,
    required this.isDeleted,
    required this.deletedBy,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });

  ProductPropName copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? unitEn,
    String? unitAr,
    dynamic defaultValues,
    bool? isDeleted,
    dynamic deletedBy,
    DateTime? createdAt,
    String? createdBy,
    DateTime? updatedAt,
    dynamic updatedBy,
  }) =>
      ProductPropName(
        id: id ?? this.id,
        nameEn: nameEn ?? this.nameEn,
        nameAr: nameAr ?? this.nameAr,
        unitEn: unitEn ?? this.unitEn,
        unitAr: unitAr ?? this.unitAr,
        defaultValues: defaultValues ?? this.defaultValues,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedBy: deletedBy ?? this.deletedBy,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
      );

  factory ProductPropName.fromRawJson(String str) =>
      ProductPropName.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductPropName.fromJson(Map<String, dynamic> json) =>
      ProductPropName(
        id: json["id"],
        nameEn: json["nameEn"],
        nameAr: json["nameAr"],
        unitEn: json["unitEn"],
        unitAr: json["unitAr"],
        defaultValues: json["defaultValues"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameEn": nameEn,
        "nameAr": nameAr,
        "unitEn": unitEn,
        "unitAr": unitAr,
        "defaultValues": defaultValues,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy,
        "createdAt": createdAt.toIso8601String(),
        "createdBy": createdBy,
        "updatedAt": updatedAt.toIso8601String(),
        "updatedBy": updatedBy,
      };
}
