import 'dart:collection';

import 'package:activity_tracker/shared/models/typedefs.dart';
import 'package:flutter/material.dart';

import '../models/activity.dart';

class ActivityController extends ChangeNotifier {
  UnmodifiableListView<Activity> get activities =>
      UnmodifiableListView(_activities.toList());

  final Set<Activity> _activities = {};

  void addActivity(Activity activity) {
    if (_activities.contains(activity)) return;
    _activities.add(activity);
    notifyListeners();
  }

  void updateActivity(Activity activity, {Handler onSuccess}) {
    _activities.remove(activity);
    _activities.add(activity);
    onSuccess?.call(null);
    notifyListeners();
  }

  void deleteActivity(Activity activity, {Handler onSuccess}) {
    _activities.remove(activity);
    onSuccess?.call(null);
    notifyListeners();
  }

  Activity getActivityById(String id) {
    return _activities.firstWhere((item) => item.key == id);
  }
}
