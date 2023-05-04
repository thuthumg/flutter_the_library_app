import 'package:flutter/material.dart';

class RadioGroupView extends StatefulWidget {
  final Function(String?) onTapFilterItem;
  final List<String> filterTypeList;

  RadioGroupView({required this.filterTypeList,
  required this.onTapFilterItem});

  @override
  _RadioGroupWidgetState createState() => _RadioGroupWidgetState();
}

class _RadioGroupWidgetState extends State<RadioGroupView> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.filterTypeList
          .map((item) => RadioListTile(
        title: Text(item),
        value: item,
        groupValue: _selectedItem,
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
            widget.onTapFilterItem(_selectedItem);
          });
        },
      ))
          .toList(),
    );
  }
}
