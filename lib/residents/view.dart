import 'package:edipro_prueba/residents/widgets.dart';
import 'package:edipro_prueba/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResidentsView extends StatelessWidget {
  const ResidentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Residentes'),
        Column(
          children: const [
            ResidentCard(
              avatarUrl:
                  'https://res.cloudinary.com/dxpcctw95/image/upload/v1725053289/avatar_1_ptn3ej.png',
              name: 'Alejandra González',
              phone: '569 1234 5678',
              email: 'alejandra.g.a@gmail.com',
              type: 'resident',
            ),
            ResidentCard(
              avatarUrl:
                  'https://res.cloudinary.com/dxpcctw95/image/upload/v1725054401/dog_gkrupi.png',
              name: 'Zapallito',
              age: '10 años',
              type: 'pet',
            )
          ],
        )
      ],
    );
  }
}
