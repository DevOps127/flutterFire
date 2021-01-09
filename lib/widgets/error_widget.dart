import 'package:flutter/material.dart';

class ErrorIconWidget extends StatelessWidget {
  const ErrorIconWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error_outline,
        color: Colors.redAccent,
        size: 20,
      ),
    );
  }
}
