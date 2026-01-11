import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memorystack/database/boxes.dart';
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
          child: ValueListenableBuilder(
            valueListenable: boxMemorys.listenable(),
            builder: (context, box, _) {
              return ListView.builder(
                padding: const EdgeInsets.only(left: 50),
                itemCount: boxMemorys.length,
                itemBuilder: (context, index) {
                  final memory = boxMemorys.getAt(index)!;

                  return ThingTile(
                    memory: memory,
                    isFirstTile: index == 0,
                    isLastTile: index == boxMemorys.length - 1,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
