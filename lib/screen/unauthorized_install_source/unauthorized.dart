import 'package:flutter/material.dart';

class Unauthorized extends StatelessWidget {
  const Unauthorized({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(child: Text('Unauthorized')),
    );
  }
}
