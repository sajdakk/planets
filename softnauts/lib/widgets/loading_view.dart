import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      value: null,
      minHeight: 4.0,
    );
  }
}
