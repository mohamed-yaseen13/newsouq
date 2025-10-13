// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'new_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewProductModel _$NewProductModelFromJson(Map<String, dynamic> json) =>
    NewProductModel(
      category: json['category'] as String,
      costPrice: (json['costPrice'] as num).toDouble(),
      description: json['description'] as String,
      discount: (json['discount'] as num).toDouble(),
      imagesUrl: (json['imagesUrl'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$NewProductModelToJson(NewProductModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'costPrice': instance.costPrice,
      'description': instance.description,
      'discount': instance.discount,
      'imagesUrl': instance.imagesUrl,
      'name': instance.name,
      'quantity': instance.quantity,
      'sellingPrice': instance.sellingPrice,
    };
