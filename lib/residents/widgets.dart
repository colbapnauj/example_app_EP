import 'package:edipro_prueba/UIStandard/Atoms/basic_card.dart';
import 'package:flutter/material.dart';

class ResidentCard extends StatelessWidget {
  const ResidentCard({
    super.key,
    required this.name,
    this.phone,
    this.email,
    this.age,
    required this.type,
    required this.avatarUrl,
  });

  final String name;
  final String? phone;
  final String? email;
  final String? age;
  final String type;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    IconData getIcon() {
      if (type == 'resident') {
        return Icons.person;
      } else if (type == 'pet') {
        return Icons.person_outline;
      } else {
        return Icons.person_off;
      }
    }

    String getTypeLabel() {
      if (type == 'resident') {
        return 'Residente';
      } else if (type == 'pet') {
        return 'Perro';
      } else {
        return 'Invitado';
      }
    }

    return BasicCard(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(child: Image.network(avatarUrl)),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            if (phone != null) _ResidentLabel(icon: Icons.phone, text: phone!),
            const SizedBox(height: 5),
            if (email != null) _ResidentLabel(icon: Icons.email, text: email!),
            if (age != null) ...[
              Text(age!),
              const SizedBox(height: 5),
            ] else
              const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xff3F484A)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Icon(getIcon(), color: const Color(0xff006876)),
                      Text(getTypeLabel()),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ResidentLabel extends StatelessWidget {
  const _ResidentLabel({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: const Color(0xff3F484A),
        ),
        const SizedBox(width: 5),
        Text(text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff3F484A),
            )),
      ],
    );
  }
}
