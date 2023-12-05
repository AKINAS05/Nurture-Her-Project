import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class newFormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  newFormContainerWidget({
    this.controller,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,


  });


  @override
  State<newFormContainerWidget> createState() => _newFormContainerWidgetState();
}

class _newFormContainerWidgetState extends State<newFormContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: new TextFormField(
        style : TextStyle(color: Colors.blue),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: new InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black45),

        ),

      ),
    );
  }
}

