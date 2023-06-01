import 'package:flutter/material.dart';

import 'form_field.dart';

class MyQuantityPicker extends StatefulWidget {
  const MyQuantityPicker(
      {super.key, this.amount, required this.onChanged, required this.title});
  final String title;
  final int? amount;
  final ValueChanged<int> onChanged;

  @override
  State<MyQuantityPicker> createState() => _MyQuantityPickerState();
}

class _MyQuantityPickerState extends State<MyQuantityPicker> {
  late final _textEditingController =
      TextEditingController(text: widget.amount?.toString());
  late var currentAmount = widget.amount ?? 0;

  @override
  Widget build(BuildContext context) {
    return MyFormField(
      title: widget.title,
      padding: const EdgeInsets.fromLTRB(16, 6, 6, 6),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: TextFormField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Any'),
              onChanged: (value) {
                currentAmount = int.tryParse(value) ?? 0;
                widget.onChanged(int.tryParse(value) ?? 0);
              },
            ),
          ),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.remove,
                      color: Theme.of(context).colorScheme.outline),
                  onPressed: () {
                    if (currentAmount <= 1) return;
                    currentAmount = currentAmount - 1;
                    _textEditingController.text = currentAmount.toString();
                    widget.onChanged(currentAmount);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  onPressed: () {
                    currentAmount = currentAmount + 1;
                    _textEditingController.text = currentAmount.toString();
                    widget.onChanged(currentAmount);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
