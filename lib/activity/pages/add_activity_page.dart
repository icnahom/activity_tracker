import 'package:activity_tracker/activity/models/activity.dart';
import 'package:activity_tracker/activity/widgets/quantity_picker.dart';
import 'package:activity_tracker/activity/widgets/multi_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../shared/models/activity_types.dart';
import '../controllers/activity_controller.dart';
import '../controllers/add_activity_controller.dart';
import '../models/parameter.dart';
import '../widgets/form_field.dart';

class MyAddActivityPage extends StatefulWidget {
  const MyAddActivityPage({super.key, this.activity});
  final Activity? activity;

  @override
  State<MyAddActivityPage> createState() => _MyAddActivityPageState();
}

class _MyAddActivityPageState extends State<MyAddActivityPage> {
  var parameter = Parameter();

  bool get isUpdate => widget.activity != null;

  @override
  void initState() {
    super.initState();
    if (isUpdate) {
      parameter = Parameter.fromActivity(widget.activity!);
    }
  }

  _handleAddingActivity() async {
    final scaffoldMessager = ScaffoldMessenger.of(context);
    final activityController = context.read<ActivityController>();

    await context.read<AddActivityController>().fetchActivity(
      parameter,
      onSuccess: (activity) {
        activityController.addActivity(activity);
        if (context.mounted) context.pop();
      },
      onError: (error) {
        scaffoldMessager.showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
    );
  }

  _handleUpdatingActivity() {
    final scaffoldMessager = ScaffoldMessenger.of(context);
    final activity = Activity.fromParameter(parameter);

    context.read<ActivityController>().updateActivity(
      activity,
      onSuccess: (_) {
        if (context.mounted) context.pop();
        scaffoldMessager.showSnackBar(
          const SnackBar(content: Text("Updated Successfully")),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${isUpdate ? 'Update' : 'Add'} Activity"),
      ),
      body: Consumer<AddActivityController>(
        builder: (context, controller, _) {
          if (controller.status.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 72.0),
            children: [
              if (isUpdate) ...[
                MyFormField(
                  title: 'Activity',
                  padding: const EdgeInsets.fromLTRB(16, 6, 6, 6),
                  child: TextFormField(
                    initialValue: parameter.activity,
                    onChanged: (value) {
                      parameter.activity = value;
                    },
                  ),
                ),
                MyFormField(
                  title: 'Link',
                  padding: const EdgeInsets.fromLTRB(16, 6, 6, 6),
                  child: TextFormField(
                    initialValue: parameter.link,
                    decoration: const InputDecoration(hintText: 'Add link'),
                    onChanged: (value) {
                      parameter.link = value;
                    },
                  ),
                ),
              ],
              MyMultiSlider(
                title: 'Accessibility',
                useRangeSlider: parameter.useRangeValues,
                value: parameter.accessibility,
                startRangeValue: parameter.minAccessibility,
                endRangeValue: parameter.maxAccessibility,
                onValueChange: (value) {
                  setState(() {
                    parameter.accessibility = value;
                  });
                },
                onRangeValuesChange: (value) {
                  setState(() {
                    parameter.minAccessibility = value.start;
                    parameter.maxAccessibility = value.end;
                  });
                },
              ),
              MyFormField(
                title: 'Type',
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                child: DropdownButtonFormField<String>(
                  value: parameter.type,
                  decoration: const InputDecoration(hintText: 'Any'),
                  iconEnabledColor: Theme.of(context).colorScheme.outline,
                  dropdownColor: Theme.of(context).colorScheme.surfaceVariant,
                  items: activityTypes
                      .map((type) => DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    parameter.type = value;
                  },
                ),
              ),
              MyQuantityPicker(
                title: 'Participants',
                amount: parameter.participants,
                onChanged: (value) {
                  parameter.participants = value;
                },
              ),
              MyMultiSlider(
                title: 'Price',
                useRangeSlider: parameter.useRangeValues,
                value: parameter.price,
                startRangeValue: parameter.minPrice,
                endRangeValue: parameter.maxPrice,
                onValueChange: (value) {
                  setState(() {
                    parameter.price = value;
                  });
                },
                onRangeValuesChange: (value) {
                  setState(() {
                    parameter.minPrice = value.start;
                    parameter.maxPrice = value.end;
                  });
                },
              ),
              if (!isUpdate)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SwitchListTile(
                    title: const Text('Use range slider?'),
                    value: parameter.useRangeValues,
                    onChanged: (value) {
                      setState(() {
                        parameter.useRangeValues = value;
                      });
                    },
                  ),
                )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: isUpdate ? _handleUpdatingActivity : _handleAddingActivity,
        label: const Text('Submit'),
        icon: const Icon(Icons.check),
      ),
    );
  }
}
