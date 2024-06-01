
// class CardModel {

  
//   TheCollectionResult result;
//   int statusCode;
//   String message;

//   CardModel({
//     required this.result,
//     required this.statusCode,
//     required this.message,
//   });

//   TheCollectionModel copyWith({
//     TheCollectionResult? result,
//     int? statusCode,
//     String? message,
//   }) =>
//       TheCollectionModel(
//         result: result ?? this.result,
//         statusCode: statusCode ?? this.statusCode,
//         message: message ?? this.message,
//       );

//   factory TheCollectionModel.fromRawJson(String str) =>
//       TheCollectionModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory TheCollectionModel.fromJson(Map<String, dynamic> json) =>
//       TheCollectionModel(
//         result: TheCollectionResult.fromJson(json["result"]),
//         statusCode: json["statusCode"],
//         message: json["message"],
//       );

//   // Map<String, dynamic> toJson() => {
//   //       "result": result.toJson(),
//   //       "statusCode": statusCode,
//   //       "message": message,
//   //     };
// }