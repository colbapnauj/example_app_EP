import 'package:flutter/material.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xffBFC8CA), width: 2),
      ),
      child: child,
    );
  }
}
