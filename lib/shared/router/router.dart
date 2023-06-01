// GoRouter configuration
import 'package:activity_tracker/activity/controllers/activity_controller.dart';
import 'package:activity_tracker/activity/pages/activity_page.dart';
import 'package:activity_tracker/activity/pages/add_activity_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../activity/pages/home_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
      routes: [
        GoRoute(
          path: 'activity/new',
          builder: (context, state) => const MyAddActivityPage(),
        ),
        GoRoute(
          path: 'activity/:id',
          builder: (context, state) {
            final id = state.params['id'];
            final controller = context.read<ActivityController>();
            final activity = controller.getActivityById(id!);
            return MyActivity(activity: activity);
          },
          routes: [
            GoRoute(
              path: 'edit',
              builder: (context, state) {
                final id = state.params['id'];
                final controller = context.read<ActivityController>();
                final activity = controller.getActivityById(id!);
                return MyAddActivityPage(activity: activity);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
