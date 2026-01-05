import 'package:flutter/material.dart';

class ThingsTimelineWidget extends StatelessWidget {
  const ThingsTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 35, top: 40),
            child: Text(
              'Memory Log',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 28,
                letterSpacing: -0.8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}