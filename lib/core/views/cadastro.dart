import 'package:first_project/core/views/cadastro_pj.dart';
import 'package:first_project/core/views/clientes.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Clientes'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Pessoa Física'),
              Tab(text: 'Pessoa Jurídica'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Clientes(),
            CadastroPJ()
          ],
        )
      ),
    );
  }
}