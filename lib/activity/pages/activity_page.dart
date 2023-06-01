import 'package:activity_tracker/activity/controllers/activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/activity.dart';

class MyActivity extends StatelessWidget {
  const MyActivity({super.key, required this.activity});
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    handleDeletingActivity() {
      context.read<ActivityController>().deleteActivity(
        activity,
        onSuccess: (_) {
          context.pop();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
        actions: [
          IconButton(
            onPressed: handleDeletingActivity,
            icon: const Icon(Icons.delete_outline),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
        children: [
          ListTile(
            title: Text(
              activity.activity,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: activity.link.isNotEmpty ? Text(activity.link) : null,
          ),
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Accessibility'),
            trailing: CircularProgressIndicator(
              value: activity.accessibility,
              backgroundColor: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          ListTile(
            title: const Text('Price'),
            trailing: CircularProgressIndicator(
              value: activity.price,
              backgroundColor: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          ListTile(
            title: const Text('Participants'),
            trailing: Chip(
              label: Text(activity.participants.toString()),
            ),
          ),
          ListTile(
            title: const Text('Type'),
            trailing: Chip(
              label: Text(activity.type),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/activity/${activity.key}/edit');
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
