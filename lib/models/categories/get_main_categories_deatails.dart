/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class MainCategoriesResult {
    int? id;
    String? nameAr;
    String? nameEn;
    String? image;

    MainCategoriesResult({this.id, this.nameAr, this.nameEn, this.image}); 

    MainCategoriesResult.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        nameAr = json['nameAr'];
        nameEn = json['nameEn'];
        image = json['image'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['nameAr'] = nameAr;
        data['nameEn'] = nameEn;
        data['image'] = image;
        return data;
    }
}

class GetMainCategoriesModle {
    List<MainCategoriesResult?>? result;
    int? statusCode;
    String? message;

    GetMainCategoriesModle({this.result, this.statusCode, this.message}); 

    GetMainCategoriesModle.fromJson(Map<String, dynamic> json) {
        if (json['result'] != null) {
         result = <MainCategoriesResult>[];
         json['result'].forEach((v) {
         result!.add(MainCategoriesResult.fromJson(v));
        });
      }
        statusCode = json['statusCode'];
        message = json['message'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['result'] =result != null ? result!.map((v) => v?.toJson()).toList() : null;
        data['statusCode'] = statusCode;
        data['message'] = message;
        return data;
    }
}

