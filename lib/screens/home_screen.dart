import 'package:flutter/material.dart';
import 'package:memorystack/widgets/header_widget.dart';
import 'package:memorystack/widgets/things_timeline_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 15,
          ),
        ),
      ),

      body: Column(
        children: [
          HeaderWidget(),

          ThingsTimelineWidget(),
        ],
      ),
    );
  }
}
