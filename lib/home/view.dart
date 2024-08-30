import 'package:edipro_prueba/encomienda/view.dart';
import 'package:edipro_prueba/expenses/view.dart';
import 'package:edipro_prueba/news/view.dart';
import 'package:edipro_prueba/residents/view.dart';
import 'package:flutter/material.dart';

enum TabEnum { home, payments, shipments, news }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          NewsView(),
          SizedBox(height: 10),
          ExpensesView(),
          SizedBox(height: 10),
          ResidentsView(),
          SizedBox(height: 10),
          EncomiendaView(),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
