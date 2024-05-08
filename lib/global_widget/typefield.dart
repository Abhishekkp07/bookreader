import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final Widget? prefixIcon;
  final String ? labelText;
  const TypeField({super.key, this.controller, this.prefixIcon, this.labelText, this.validator, });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validator ,
      decoration: InputDecoration(border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      prefixIcon: prefixIcon,
      labelText:labelText ),

    );
  }
}
