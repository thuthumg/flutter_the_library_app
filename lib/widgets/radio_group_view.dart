import 'package:flutter/material.dart';

class RadioGroupView extends StatefulWidget {
  final Function(String?) onTapFilterItem;
  final List<String> filterTypeList;
  String autoSelectedData;

  RadioGroupView({
    required this.autoSelectedData,
    required this.filterTypeList,
  required this.onTapFilterItem});

  @override
  _RadioGroupWidgetState createState() => _RadioGroupWidgetState();
}

class _RadioGroupWidgetState extends State<RadioGroupView> {
  String? _selectedItem;


  @override
  void initState() {
    _selectedItem = widget.autoSelectedData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.filterTypeList
          .map((item) => RadioListTile(
        title: Text(item),
        selected: (widget.autoSelectedData == item) ? true : false,
        //activeColor: Colors.cyan,
        value: item,
        groupValue: _selectedItem,
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
            debugPrint("RadioGroupView ${_selectedItem}");
            widget.onTapFilterItem(_selectedItem);

          });
        },
      ))
          .toList(),
    );
  }
}
