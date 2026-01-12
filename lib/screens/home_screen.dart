import 'package:flutter/material.dart';
import 'package:memorystack/services/database_service.dart';
import 'package:memorystack/widgets/create_memory_widget.dart';
import 'package:memorystack/widgets/header_widget.dart';
import 'package:memorystack/widgets/things_timeline_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseService _databaseService = DatabaseService.instance;
  final TextEditingController memoryNameController = TextEditingController();
  final TextEditingController memoryDescController = TextEditingController();

  // We'll use this to trigger the timeline refresh
  Key timelineKey = UniqueKey();

  void saveMemory() async {
    if (memoryNameController.text.trim().isEmpty ||
        memoryDescController.text.trim().isEmpty) {
      return;
    }

    _databaseService.addMemory(
      memoryNameController.text,
      memoryDescController.text,
    );

    // Clear text fields
    memoryNameController.clear();
    memoryDescController.clear();

    Navigator.pop(context);

    // Trigger rebuild of ThingsTimelineWidget
    setState(() {
      timelineKey = UniqueKey();
    });
  }

  @override
  void dispose() {
    memoryNameController.dispose();
    memoryDescController.dispose();
    super.dispose();
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

      body: Column(
        children: [
          HeaderWidget(),

          ThingsTimelineWidget(key: timelineKey),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return CreateMemoryWidget(
                savePressed: saveMemory,
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
