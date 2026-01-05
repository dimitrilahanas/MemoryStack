import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      height: 200,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
