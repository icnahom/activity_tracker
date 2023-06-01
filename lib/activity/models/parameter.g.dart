// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ParameterToJson(Parameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('type', instance.type);
  writeNotNull('participants', Parameter._intToString(instance.participants));
  writeNotNull('price', Parameter._doubleToString(instance.price));
  writeNotNull('minprice', Parameter._doubleToString(instance.minPrice));
  writeNotNull('maxprice', Parameter._doubleToString(instance.maxPrice));
  writeNotNull(
      'accessibility', Parameter._doubleToString(instance.accessibility));
  writeNotNull(
      'minaccessibility', Parameter._doubleToString(instance.minAccessibility));
  writeNotNull(
      'maxAccessibility', Parameter._doubleToString(instance.maxAccessibility));
  return val;
}
