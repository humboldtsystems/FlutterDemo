import 'package:flutter/material.dart';
import 'app_drawer.dart';

class PlaceholderPage1 extends StatelessWidget {
  const PlaceholderPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placeholder Page 1'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('This is Placeholder Page 1'),
      ),
    );
  }
}
