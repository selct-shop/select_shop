class SignInModle {
  SignInModle({
    required this.data,
    required this.statusCode,
    required this.message,
  });
  late final Data data;
  late final int statusCode;
  late final String message;
  
  SignInModle.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['statusCode'] = statusCode;
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
     this.phoneVerifiedAt,
     this.emailVerifiedAt,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.isBlocked,
     this.blockedBy,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phoneNumber;
  late final Null phoneVerifiedAt;
  late final Null emailVerifiedAt;
  late final String password;
  late final String createdAt;
  late final String updatedAt;
  late final bool isDeleted;
  late final bool isBlocked;
  late final Null blockedBy;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    phoneVerifiedAt = null;
    emailVerifiedAt = null;
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isDeleted = json['isDeleted'];
    isBlocked = json['isBlocked'];
    blockedBy = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    _data['phoneVerifiedAt'] = phoneVerifiedAt;
    _data['emailVerifiedAt'] = emailVerifiedAt;
    _data['password'] = password;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['isDeleted'] = isDeleted;
    _data['isBlocked'] = isBlocked;
    _data['blockedBy'] = blockedBy;
    return _data;
  }
}