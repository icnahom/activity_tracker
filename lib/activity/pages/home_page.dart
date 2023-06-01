import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../controllers/activity_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activities')),
      body: Consumer<ActivityController>(
        builder: (context, value, child) {
          if (value.activities.isEmpty) {
            return const Center(
              child: Text('No activites, yet.'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: value.activities.length,
            itemBuilder: (context, index) {
              final activity = value.activities.elementAt(index);
              return Card(
                margin: const EdgeInsets.only(bottom: 16), 
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: ListTile(
                    title: Text(activity.activity),
                    subtitle: Text(activity.type),
                    onTap: () {
                      context.push('/activity/${activity.key}');
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/activity/new');
        },
        label: const Text('Add Activity'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
