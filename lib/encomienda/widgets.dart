import 'package:flutter/material.dart';

class EncomiendaCard extends StatelessWidget {
  const EncomiendaCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Color(0xffBFC8CA),
            width: 2,
          )),
      subtitle: Text(subtitle),
      leading: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Icon(
                Icons.newspaper,
                color: Color(0xff3f484a),
              )),
        ),
      ),
    );
  }
}
