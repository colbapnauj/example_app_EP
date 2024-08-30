import 'package:flutter/material.dart';

class NewsFile extends StatelessWidget {
  const NewsFile({
    Key? key,
    this.icon = Icons.file_present_outlined,
    required this.text,
  }) : super(
          key: key,
        );

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // min width
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xff006876),
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xff3F484A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
