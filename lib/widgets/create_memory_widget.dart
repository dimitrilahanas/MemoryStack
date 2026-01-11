import 'package:flutter/material.dart';

class CreateMemoryWidget extends StatelessWidget {
  final VoidCallback savePressed;

  const CreateMemoryWidget({super.key, required this.savePressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Text(
              'Add to Memory Log',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
                fontSize: 25,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
            child: TextField(
              controller: null,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelStyle: TextStyle(fontSize: 18),
                label: Text(
                  "Memory Name",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                hint: Text(
                  "Serviced the car",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary.withAlpha(155),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: TextField(
              maxLines: 4,
              controller: null,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelStyle: TextStyle(fontSize: 18),
                label: Text(
                  "Memory Notes",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                hint: Text(
                  "Oil change and air filter replaced.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary.withAlpha(155),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: TextButton(
              onPressed: savePressed,
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary.withAlpha(20),
                minimumSize: Size(80, 20),
              ),
              child: Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}
