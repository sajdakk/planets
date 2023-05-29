import 'package:flutter/material.dart';

abstract class SnTextStyles {
  static const TextStyle _dMSans = TextStyle(
    fontFamily: 'DMSans',
  );

  static final TextStyle dMSansLarge24 = _dMSans.copyWith(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle dMSansRegular16 = _dMSans.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle dMSansSmall14 = _dMSans.copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
}
