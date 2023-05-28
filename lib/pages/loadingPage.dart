import 'package:flutter/material.dart';

class LoagingPage extends StatelessWidget {
  const LoagingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
