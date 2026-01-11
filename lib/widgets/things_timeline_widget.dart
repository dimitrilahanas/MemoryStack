import 'package:flutter/material.dart';
import 'package:memorystack/widgets/thing_tile.dart';

class ThingsTimelineWidget extends StatelessWidget {
  const ThingsTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, top: 40),
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

        SizedBox(
          width: screenWidth,
          height: 420,
          child: ListView(
            padding: EdgeInsets.only(left: 50),
            children: [
              ThingTile(isFirstTile: true, isLastTile: false),
              ThingTile(isFirstTile: false, isLastTile: false),
              ThingTile(isFirstTile: false, isLastTile: false),
              ThingTile(isFirstTile: false, isLastTile: false),
              ThingTile(isFirstTile: false, isLastTile: true),
            ],
          ),
        ),
      ],
    );
  }
}
