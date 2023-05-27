import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';

class EditTextWithLimitView extends StatefulWidget {
  final int maxLength;
  final Function(String) onTapDone;
  final String paramRenameShelfName;

   EditTextWithLimitView({Key? key,
    required this.maxLength,
    required this.paramRenameShelfName,
  required this.onTapDone}) : super(key: key);

  @override
  _EditTextWithLimitViewState createState() => _EditTextWithLimitViewState();
}

class _EditTextWithLimitViewState extends State<EditTextWithLimitView> {
  late TextEditingController _controller;
 // int _textLength = 0;
 // String initialValue = 'Initial Value';

  @override
  void initState() {
    super.initState();
   // _controller = TextEditingController();
    _controller = TextEditingController(text: widget.paramRenameShelfName);
    _controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: widget.paramRenameShelfName.length,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TextFormField(

          textInputAction: TextInputAction.done,
          controller: _controller,
          maxLength: widget.maxLength,
          decoration: const InputDecoration(
            labelText: '',
            hintText: 'Shelf name',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w500
            )
          ),

          onFieldSubmitted: (value){
            widget.onTapDone(value);
          },
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
