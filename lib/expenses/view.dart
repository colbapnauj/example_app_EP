import 'package:edipro_prueba/UIStandard/Atoms/basic_card.dart';
import 'package:edipro_prueba/expenses/widgets/chart.dart';
import 'package:edipro_prueba/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ExpensesView extends StatelessWidget {
  const ExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const SectionTitle(title: 'Gastos'),
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          children: const [
            ExpenseCard(
              title: 'Deuda total',
              date: 'Abril 2024',
              amount: 113.693,
              status: ExpenseStatus.payment,
            ),
            ExpenseCard(
              title: 'Último Pago',
              date: '29 Marzo 2024',
              amount: 102.890,
              status: ExpenseStatus.shipment,
            ),
          ],
        ),
        BasicCard(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gastos Comunes',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: 'Abril 2024',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff3F484A))),
                          TextSpan(
                              text: ' - Incrementó un 10.5%',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff006876))),
                        ])),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: Color(0xffBBE9FF),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const BarChartSample4(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum ExpenseStatus { payment, shipment }

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.status,
  });

  final String title;
  final String date;
  final num amount;
  final ExpenseStatus status;

  @override
  Widget build(BuildContext context) {
    String getFormatAmount() {
      return '\$${amount.toString()}';
    }

    buildButton() {
      switch (status) {
        case ExpenseStatus.payment:
          return TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: const Size(200, 50),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
                side: const BorderSide(color: Color(0xff6F797B)),
              ),
            ),
            child: const Text(
              'Pagar',
              style: TextStyle(color: Color(0xff006876)),
            ),
          );
        case ExpenseStatus.shipment:
          return TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: const Size(200, 50),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              backgroundColor: Colors.transparent,
            ),
            child: const Text(
              'Ver historial',
              style: TextStyle(color: Color(0xff006876)),
            ),
          );
      }
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Color(0xffBFC8CA), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(date,
              style: const TextStyle(fontSize: 14, color: Color(0xff3F484A))),
          const SizedBox(height: 5),
          Text(getFormatAmount(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff171C1F),
              )),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: buildButton(),
          ),
        ]),
      ),
    );
  }
}
