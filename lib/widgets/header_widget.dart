import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      height: 250,
      width: screenWidth,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),

      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 35, top: 0),
          child: Text(
            "Don't Forget These",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 28,
              letterSpacing: -0.8,
            ),
          ),
        ),
      ),
    );
  }
}
