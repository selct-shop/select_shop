import 'package:json_annotation/json_annotation.dart';
import 'package:select_shop/models/Location%20models/getAllEmaritesModle.dart';

// part 'local_location_model.g.dart'; // This is the generated file name

// @JsonSerializable() 
class LocalLocationModel {
  final AddressCityModle addressCityModle;
  final String? theArea, theStreet, theBuilding, theAppartment, thePost, locationTag;

  LocalLocationModel({
    required this.addressCityModle,
    required this.theArea,
    required this.theStreet,
    required this.theBuilding,
    required this.theAppartment,
    required this.thePost,
    required this.locationTag,
  });

  // factory LocalLocationModel.fromJson(Map<String, dynamic> json) => _$LocalLocationModelFromJson(json);

  // Map<String, dynamic> toJson() => _$LocalLocationModelToJson(this);
}
