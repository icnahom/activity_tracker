import 'package:activity_tracker/shared/models/typedefs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../../shared/api/resource.dart';
import '../models/activity.dart';
import '../models/parameter.dart';

class ActivityService {
  ActivityService(this.client);
  final http.Client client;

  Future<Activity> fetchActivity(Parameter parameter) async {
    final uri = Uri.https(Resource.baseUrl, Resource.activity, parameter.toJson());
    final response = await client.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      final jsonData = jsonDecode(response.body) as Json;
      if (jsonData.containsKey('error')) throw jsonData['error'];
      return Activity.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch activity');
    }
  }
}
