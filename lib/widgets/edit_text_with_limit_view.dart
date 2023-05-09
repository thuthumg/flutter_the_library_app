import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';

class EditTextWithLimitView extends StatefulWidget {
  final int maxLength;
  final Function onTapDone;
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

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _controller.addListener(() {
      setState(() {
       // _textLength = _controller.text.length;
       // widget.onTapDone();
      });
    });
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
         // initialValue: widget.paramRenameShelfName??"",
          decoration: InputDecoration(
            labelText: '',
            hintText: 'Shelf name',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w500
            )
          ),
         // initialValue: "Initial value",
          onFieldSubmitted: (value){
            widget.onTapDone();
          },
        ),
        SizedBox(height: 8),
        // Text(
        //   '$_textLength/${widget.maxLength}',
        //   style: TextStyle(
        //     fontSize: 12,
        //     color: _textLength > widget.maxLength ? Colors.red : Colors.grey,
        //   ),
        // ),

      ],
    );
  }
}
