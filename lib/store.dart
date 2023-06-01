import 'activity/controllers/activity_controller.dart';
import 'activity/controllers/add_activity_controller.dart';
import 'activity/services/activity_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class Store {
  Store._(this.httpClient);

  final http.Client httpClient;
  late final activityService = ActivityService(httpClient);

  final activityController = ActivityController();
  late final addActivityController = AddActivityController(activityService);

  static Future<Store> initialize({bool enableTesting = false}) async {
    // asynchronouse initializations

    final httpClient = enableTesting
        ? MockClient((_) => throw UnimplementedError())
        : http.Client();

    return Store._(httpClient);
  }
}
