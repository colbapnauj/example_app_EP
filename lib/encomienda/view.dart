import 'package:edipro_prueba/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class EncomiendaView extends StatelessWidget {
  const EncomiendaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const SectionTitle(title: 'Encomiendas'),
        Column(
          children: const [
            EncomiendaCard(
              title: 'Lista para entrega',
              subtitle: 'Recibido a las 18:01 PM',
            ),
            SizedBox(height: 10),
            EncomiendaCard(
              title: 'Recibida por Maite',
              subtitle: 'Lunes 8 abril - 16:45 PM',
            ),
          ],
        )
      ],
    );
  }
}
