import 'package:flutter/material.dart';

import 'form_field.dart';

class MyMultiSlider extends StatelessWidget {
  const MyMultiSlider({
    super.key,
    required this.title,
    this.useRangeSlider = false,
    double? value,
    double? startRangeValue,
    double? endRangeValue,
    this.onValueChange,
    this.onRangeValuesChange,
  })  : value = value ?? 0,
        startRangeValue = startRangeValue ?? 0,
        endRangeValue = endRangeValue ?? 0;
  final String title;
  final bool useRangeSlider;
  final double? value;
  final double? startRangeValue;
  final double? endRangeValue;
  final ValueChanged<double>? onValueChange;
  final ValueChanged<RangeValues>? onRangeValuesChange;

  @override
  Widget build(BuildContext context) {
    return MyFormField(
      title: title,
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: useRangeSlider
          ? RangeSlider(
              values: RangeValues(
                startRangeValue!,
                endRangeValue!,
              ),
              labels: RangeLabels(
                startRangeValue!.toStringAsFixed(2),
                endRangeValue!.toStringAsFixed(2),
              ),
              onChanged: onRangeValuesChange)
          : Slider(
              value: value!,
              label: value!.toStringAsFixed(2),
              onChanged: onValueChange,
            ),
    );
  }
}
