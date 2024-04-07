import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final bool isSelected;
  final Color color;
  const ColorItem({super.key, required this.isSelected, required this.color});

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}
