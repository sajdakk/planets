import 'package:flutter/material.dart';
import 'package:planets/planets.dart';

class MyTextInput extends StatelessWidget {
  const MyTextInput({
    super.key,
    this.labelText,
    this.controller,
  });

  final String? labelText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: MyTextStyles.dMSansRegular16.copyWith(
        fontWeight: FontWeight.w400,
        color: MyColors.textColor,
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
        focusColor: MyColors.neutral,
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        labelStyle: MyTextStyles.dMSansSmall14.copyWith(
          color: MyColors.textColor,
          fontSize: 16.0,
          height: 20.0 / 16.0,
        ),
        floatingLabelStyle: MyTextStyles.dMSansSmall14.copyWith(
          color: MyColors.gray,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          borderSide: BorderSide(
            color: MyColors.neutral,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          borderSide: BorderSide(
            color: MyColors.neutral,
            width: 2.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          borderSide: BorderSide(
            color: MyColors.neutral,
          ),
        ),
      ),
    );
  }
}
