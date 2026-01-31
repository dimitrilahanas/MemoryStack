import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memorystack/models/memory.dart';
import 'package:memorystack/services/database_service.dart';

class MemoryCard extends StatelessWidget {
  final Memory memory;
  final VoidCallback onDelete;
  const MemoryCard({super.key, required this.memory, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 55, left: 15, top: 10, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Slidable(
          key: ValueKey(memory.id),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {},
                icon: Icons.edit,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),

              SlidableAction(
                onPressed: (context) async {
                  DatabaseService.instance.deleteMemory(memory.id);
                  onDelete();
                },
                icon: Icons.delete,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            memory.name,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, top: 10),
                        child: Text(
                          "20/02/2026",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      memory.description,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 10,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
