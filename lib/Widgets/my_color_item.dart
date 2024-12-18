import 'package:flutter/material.dart';

class MyCoLorItem extends StatelessWidget {
  const MyCoLorItem({
    super.key,
    required this.isActive,
    required this.color,
  });
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: isActive
          ? CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 15,
              backgroundColor: color,
            ),
    );
  }
}
