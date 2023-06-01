import 'package:activity_tracker/activity/models/activity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'parameter.g.dart';

@JsonSerializable(includeIfNull: false, createFactory: false)
class Parameter {
  Parameter({
    this.key,
    this.activity,
    this.link,
    this.type,
    this.participants,
    this.price,
    this.minPrice,
    this.maxPrice,
    this.accessibility,
    this.minAccessibility,
    this.maxAccessibility,
  });
  String? key;
  @JsonKey(includeToJson: false)
  String? activity;
  @JsonKey(includeToJson: false)
  String? link;
  String? type;
  @JsonKey(toJson: _intToString)
  int? participants;
  @JsonKey(toJson: _doubleToString)
  double? price;
  @JsonKey(name: 'minprice', toJson: _doubleToString)
  double? minPrice;
  @JsonKey(name: 'maxprice', toJson: _doubleToString)
  double? maxPrice;
  @JsonKey(toJson: _doubleToString)
  double? accessibility;
  @JsonKey(name: 'minaccessibility', toJson: _doubleToString)
  double? minAccessibility;
  @JsonKey(name: 'maxAccessibility', toJson: _doubleToString)
  double? maxAccessibility;
  @JsonKey(includeToJson: false)
  bool useRangeValues = true;

  factory Parameter.fromActivity(Activity activity) {
    return Parameter(
        key: activity.key,
        activity: activity.activity,
        link: activity.link,
        type: activity.type,
        participants: activity.participants,
        price: activity.price,
        accessibility: activity.accessibility);
  }

  Map<String, dynamic> toJson() {
    _resetUnusedValues();
    return _$ParameterToJson(this);
  }

  _resetUnusedValues() {
    if (useRangeValues) {
      _resetValues();
    } else {
      _resetRangeValues();
    }
  }

  void _resetValues() {
    accessibility = null;
    price = null;
  }

  void _resetRangeValues() {
    minAccessibility = null;
    maxAccessibility = null;
    minPrice = null;
    maxPrice = null;
  }

  static String? _intToString(int? value) => value?.toString();
  static String? _doubleToString(double? value) => value?.toStringAsFixed(2);
}
