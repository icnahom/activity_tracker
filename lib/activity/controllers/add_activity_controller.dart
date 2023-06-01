import 'package:flutter/material.dart';

import '../../shared/models/status.dart';
import '../../shared/models/typedefs.dart';
import '../models/activity.dart';
import '../models/parameter.dart';
import '../services/activity_service.dart';

class AddActivityController with ChangeNotifier, StatusProviderMixin {
  AddActivityController(this.service);
  final ActivityService service;

  Future<void> fetchActivity(Parameter parameter,
      {Handler<Activity> onSuccess, Handler<String> onError}) async {
    if (status.isLoading) return;
    try {
      status = Status.loading;
      final activity = await service.fetchActivity(parameter);
      onSuccess?.call(activity);
      status = Status.success;
    } catch (e) {
      onError?.call(e.toString());
      status = Status.error;
    }
  }
}
