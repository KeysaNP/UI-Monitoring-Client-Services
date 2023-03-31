import 'package:app_monitoring_cs/tabbarPage/tabbarPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Konfig());
}

class Konfig extends StatelessWidget {
  const Konfig({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarPage(),
    );
  }
}
