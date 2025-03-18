import 'package:first_project/core/views/myaapbar.dart';
import 'package:first_project/core/views/mydrawer.dart';
import 'package:first_project/stores/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';



class Clientes extends StatelessWidget {

  final formStore = Get.find<FormStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Clientes'),
      drawer: CustomDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(

            
            children: [
              
              Observer(builder: (_) =>
              SizedBox(height: 20)),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Cod.'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nome'),
                  ))
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      //inputFormatters: [
                        //MaskTextInputFormatter(
                           // mask: '###.###.###-##',
                          //  filter: {"#": RegExp(r'[0-9]')})
                     // ],
                      decoration: InputDecoration(
                        errorText: formStore.cpfError,
                        border: OutlineInputBorder(), 
                        labelText: 'CPF'
                      ),
                      onChanged: formStore.setCpf,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        labelText: 'Logadouro', border: OutlineInputBorder()),
                    value: null,
                    items: ['Rua', 'Avenida'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      print("Selecionado: $newValue");
                    },
                  ))
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                      child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Endereco'),
                  )),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Nº'),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                      child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Bairro'),
                  )),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        MaskTextInputFormatter(
                            mask: '#####-###', filter: {"#": RegExp(r'[0-9]')})
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Cep'),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                      child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'E-mail'),
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'DD'),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        MaskTextInputFormatter(
                            mask: '#####-####', filter: {"#": RegExp(r'[0-9]')})
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Contato'),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('CANCELAR'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(15),
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text('SALVAR'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(15),
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(fontSize: 20)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
