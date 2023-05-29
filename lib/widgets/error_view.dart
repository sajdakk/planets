import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Error occured',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
