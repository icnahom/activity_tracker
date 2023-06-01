import 'package:activity_tracker/activity/models/parameter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../shared/models/typedefs.dart';
part 'activity.g.dart';

@JsonSerializable(createToJson: false)
class Activity {
  Activity({
    required this.key,
    required this.activity,
    required this.accessibility,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
  });
  final String key;
  String activity;
  double accessibility;
  String type;
  int participants;
  double price;
  String link;

  factory Activity.fromJson(Json json) => _$ActivityFromJson(json);

  factory Activity.fromParameter(Parameter parameter) {
    return Activity(
        key: parameter.key!,
        activity: parameter.activity!,
        accessibility: parameter.accessibility!,
        type: parameter.type!,
        participants: parameter.participants!,
        price: parameter.price!,
        link: parameter.link ?? '');
  }

  @override
  operator ==(Object other) =>
      other is Activity && other.runtimeType == runtimeType && other.key == key;

  @override
  int get hashCode => key.hashCode;
}
