import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:memorystack/database/boxes.dart';
import 'package:memorystack/widgets/create_memory_widget.dart';
import 'package:memorystack/widgets/header_widget.dart';
import 'package:memorystack/widgets/things_timeline_widget.dart';

import 'package:memorystack/models/memory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController memoryNameController = TextEditingController();
  final TextEditingController memoryDescController = TextEditingController();

  void saveMemory() {
    final newMemory = Memory(name: memoryNameController.text, description: memoryDescController.text, lastCompleted: 'w');
    boxMemorys.add(newMemory);

    memoryNameController.clear();
    memoryDescController.clear();

    Navigator.pop(context);
  }

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

      body: Column(children: [HeaderWidget(), ThingsTimelineWidget()]),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return CreateMemoryWidget(
                savePressed: () {
                  saveMemory();
                },
                nameController: memoryNameController,
                descController: memoryDescController,
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.secondary,
          size: 30,
        ),
      ),
    );
  }
}
