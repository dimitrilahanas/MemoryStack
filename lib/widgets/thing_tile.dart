import 'package:flutter/material.dart';
import 'package:memorystack/models/memory.dart';
import 'package:memorystack/widgets/thing_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ThingTile extends StatelessWidget {
  final bool isFirstTile;
  final bool isLastTile;
  final Memory memory;

  const ThingTile({super.key, required this.isFirstTile, required this.isLastTile, required this.memory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TimelineTile(
        isFirst: isFirstTile,
        isLast: isLastTile,
      
        beforeLineStyle: LineStyle(
          color: Color(0xFF2DD4BF),
        ),
      
        indicatorStyle: IndicatorStyle(
          color: Color(0xFF2DD4BF),
        ),
        
        endChild: ThingCard(memory: memory,),
        ),
    );
  }
}