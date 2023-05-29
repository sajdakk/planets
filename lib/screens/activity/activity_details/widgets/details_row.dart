import 'package:flutter/material.dart';
import 'package:softnauts/softnauts.dart';

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
          style: SnTextStyles.dMSansSmall14.copyWith(
            color: SnColors.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
