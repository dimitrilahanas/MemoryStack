import 'package:flutter/material.dart';

class CreateMemoryWidget extends StatelessWidget {
  final VoidCallback savePressed;
  final TextEditingController nameController;
  final TextEditingController descController;

  const CreateMemoryWidget({
    super.key,
    required this.savePressed,
    required this.nameController,
    required this.descController,
  });

  @override
  Widget build(BuildContext context) {
    final _inputDecoration = InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: TextStyle(fontSize: 18),
    );

    Text _labelText(String text) {
      return Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      );
    }

    Text _hintText(String text) {
      return Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary.withAlpha(155),
        ),
      );
    }

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
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                fontSize: 25,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
            child: TextField(
              controller: nameController,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: _inputDecoration.copyWith(
                label: _labelText('Memory Name'),
                hint: _hintText('Serviced the car'),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: TextField(
              maxLines: 4,
              controller: descController,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              decoration: _inputDecoration.copyWith(
                label: _labelText('Memory Notes'),
                hint: _hintText('Oil change and air filter replaced.'),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: TextButton(
              onPressed: savePressed,
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(20),
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
