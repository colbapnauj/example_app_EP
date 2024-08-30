import 'package:edipro_prueba/news/widgets.dart';
import 'package:edipro_prueba/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final newObj = {
    'attachments': [
      'reglamento-coproiedad.pdf',
      'arboledas-de-nunoa-document...pdf',
      'biendvenido_a-edipro.pdf'
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const SectionTitle(title: 'Noticias'),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Column(
              children: [
                // title
                ListTile(
                  title: const Text('Sin conserje'),
                  subtitle: const Text('Hoy - 12:01 PM'),
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
                ),
                const HtmlWidget('''
                      <div class="container">
        <h2>Comunicado Importante</h2>
        <p>Estimada comunidad,</p>
        <p class="important">Se informa que por motivos de fuerza mayor no habrá conserje desde las 18:00 hasta las 23:00, tomar en consideración.</p>
        <p>Por favor, mantengan el portón cerrado para evitar incidentes.</p>
        <p>Además, se recuerda que los gastos comunes deben pagarse dentro de los primeros 5 días del mes.</p>
        <p>Adjuntos encontrarán los documentos del reglamento de copropiedad.</p>
        <div class="signature">
              Atentamente,<br>
              La administración<br>
              <em>Adm.</em>
        </div>
    </div>
                  '''),
                const SizedBox(height: 20),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, int index) => NewsFile(
                    text: newObj['attachments']![index] as String,
                  ),
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: (newObj['attachments'] as List).length,
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    SizedBox(
                      width: 20,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffBBE9FF),
                        child: Icon(
                          Icons.shield,
                          color: Colors.black,
                          size: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Administración',
                      style: TextStyle(fontSize: 12, color: Color(0xff3F484A)),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
