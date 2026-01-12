import 'package:flutter/material.dart';
import 'package:memorystack/models/memory.dart';
import 'package:memorystack/services/database_service.dart';
import 'package:memorystack/widgets/thing_tile.dart';

class ThingsTimelineWidget extends StatelessWidget {
  const ThingsTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseService _databaseService = DatabaseService.instance;

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

        Padding(
          padding: EdgeInsetsGeometry.only(left: 50),
          child: SizedBox(
            height: 400,
            child: FutureBuilder(
              future: _databaseService.getMemorys(),
              builder: (context, snapshot) {
                final memories = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: memories.length,
                  itemBuilder:(context, index) {
                    Memory memory = snapshot.data![index];
                    return ThingTile(
                      isFirstTile: index == 0, isLastTile: index == memories.length - 1, memory: memory,);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
