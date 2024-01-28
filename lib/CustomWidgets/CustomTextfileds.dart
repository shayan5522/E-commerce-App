import 'package:flutter/material.dart';

class CustomTextFields extends StatefulWidget {
  TextInputType? textInputType;
  String? labeltext;
  String? hinttext;
  Icon? prefixicon;
  Icon? sufixicon;
  bool? obsecureText;

  // Added a named parameter to indicate if it's a password field
  CustomTextFields(
      this.hinttext,
      this.labeltext,
      this.prefixicon,
      this.sufixicon,
      this.textInputType, {super.key, 
        this.obsecureText,
      });

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      obscureText: widget.obsecureText ?? false,
      decoration: InputDecoration(
        hintText: widget.hinttext,
        labelText: widget.labeltext,
        prefixIcon: widget.prefixicon,
        suffixIcon: widget.sufixicon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
