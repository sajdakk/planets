import 'package:flutter/material.dart';
import 'package:softnauts/softnauts.dart';

class SnTextInput extends StatelessWidget {
  const SnTextInput({
    super.key,
    this.labelText,
    this.controller,
  });

  final String? labelText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: SnTextStyles.dMSansRegular16.copyWith(
        fontWeight: FontWeight.w400,
        color: SnColors.textColor,
      ),
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          top: 10.0,
          bottom: 16.0,
          left: 12.0,
          right: 12.0,
        ),
        focusColor: SnColors.neutral,
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        labelStyle: SnTextStyles.dMSansSmall14.copyWith(
          color: SnColors.textColor,
          fontSize: 16.0,
          height: 20.0 / 16.0,
        ),
        floatingLabelStyle: SnTextStyles.dMSansSmall14.copyWith(
          color: SnColors.gray,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          borderSide: BorderSide(
            color: SnColors.neutral,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          borderSide: BorderSide(
            color: SnColors.neutral,
            width: 2.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          borderSide: BorderSide(
            color: SnColors.neutral,
          ),
        ),
      ),
    );
  }
}
