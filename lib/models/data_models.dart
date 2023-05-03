import 'package:json_annotation/json_annotation.dart';

part 'data_models.g.dart';

@JsonSerializable(explicitToJson: true)
class DataModel {
  final String name;
  final String img;
  final int price;
  final int people;
  final int stars;
  final String description;
  final String location;
  DataModel(this.name, this.img, this.price, this.people, this.stars,
      this.description, this.location);

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
