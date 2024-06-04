import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text.substring(11),
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
            ));
  }
}
