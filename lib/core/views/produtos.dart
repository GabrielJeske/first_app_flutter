import 'package:flutter/material.dart';
import 'package:first_project/core/views/mydrawer.dart';


class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Container(
        padding: EdgeInsets.all(1.6),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    Flexible(child: TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), 
                          labelText: 'Nome'
                        ),
                       // onChanged: (value) => formStore.setField('nome', value),
                      ) )
                  ],
                )
              ],
            )
          ),
      ),
    );
  }
}