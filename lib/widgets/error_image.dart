import 'package:flutter/material.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Padding(padding: EdgeInsets.all(5), child: Text('Failed to load picture')),
    );
  }
}