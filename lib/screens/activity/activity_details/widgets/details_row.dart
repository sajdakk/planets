import 'package:flutter/material.dart';
import 'package:planets/planets.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: MyTextStyles.dMSansSmall14.copyWith(
            color: MyColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
