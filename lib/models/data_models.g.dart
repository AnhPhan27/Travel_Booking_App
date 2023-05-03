// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      json['name'] as String,
      json['img'] as String,
      json['price'] as int,
      json['people'] as int,
      json['stars'] as int,
      json['description'] as String,
      json['location'] as String,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'name': instance.name,
      'img': instance.img,
      'price': instance.price,
      'people': instance.people,
      'stars': instance.stars,
      'description': instance.description,
      'location': instance.location,
    };
