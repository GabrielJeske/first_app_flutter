import 'dart:developer';

import 'package:first_project/core/views/myaapbar.dart';
import 'package:first_project/core/views/mydrawer.dart';
import 'package:first_project/stores/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  final formStore = Get.find<FormStore>();
  
  // Criando um Map para armazenar os controladores de cada campo
  final Map<String, TextEditingController> controllers = {};

  final List<String> campos = [
    'nome', 'cpf', 'email', 'endereco', 'bairro', 'cep', 'n', 'contato' 'numero'
  ];

  @override
  void initState() {
    super.initState();

    // Inicializando controladores para cada campo
    for (var campo in campos) {
      controllers[campo] = TextEditingController();

      controllers[campo]!.addListener(() {
        formStore.setField(campo, controllers[campo]!.text);
      });
    }
  }

  @override
  void dispose() {
    // Liberar memória dos controladores
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void resetForm() {
    formStore.resetForm();
    
    // Resetar os controladores para limpar os campos sem recriá-los
    for (var campo in controllers.keys) {
      controllers[campo]!.text = '';
    }
  }


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
              SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: Observer(builder: (_) =>
                      TextFormField(
                        controller: controllers['nome'],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), 
                          errorText: formStore.formErrors['nome'],
                          labelText: 'Nome'
                        ),
                       // onChanged: (value) => formStore.setField('nome', value),
                      ) 
                    )
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Observer(builder: (_) => 
                      TextFormField(
                        controller: controllers['cpf'],
                        keyboardType: TextInputType.numberWithOptions(),                      
                        decoration: InputDecoration(
                          errorText: formStore.formErrors['cpf'],
                          border: OutlineInputBorder(), 
                          labelText: 'CPF'
                          
                        ),
                        //onChanged: (value) => formStore.setField('cpf', value)
                      ),
                    )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Observer(builder: (_) =>
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Logadouro', 
                          border: OutlineInputBorder(),
                          errorText: formStore.formErrors['logadouro'],
                        ),
                        value: formStore.formValues['logadouro'] == '' ?  null: formStore.formValues['logadouro'],
                        items: ['Rua', 'Avenida'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null){
                            formStore.setField('logadouro', newValue ?? '');
                          }                   
                        },
                      )
                    )
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    child: Observer(builder: (_) => 
                      TextFormField(
                        controller: controllers['endereco'],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), 
                          labelText: 'Endereco',
                          errorText: formStore.formErrors['endereco']
                        ),
                        //onChanged: (value) => formStore.setField('endereco', value),
                      )
                    ) 
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    child: Observer(builder: (_) =>
                      TextFormField(
                        controller: controllers['n'],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), 
                            labelText: 'Nº', 
                            errorText: formStore.formErrors['n']
                        ),
                        //onChanged: (value) => formStore.setField('n', value),
                      ),
                    )
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    child: Observer(builder: (_) =>
                      TextFormField(
                        controller: controllers['bairro'],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), 
                          labelText: 'Bairro', 
                          errorText: formStore.formErrors['bairro']
                        ),
                         // onChanged: (value) => formStore.setField('bairro', value),
                      )
                    )  
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 120,
                    child: Observer(builder: (_) =>
                      TextFormField(
                        controller: controllers['cep'],
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), 
                            labelText: 'Cep', 
                            errorText: formStore.formErrors['cep']
                            ),
                          //  onChanged: (value) => formStore.setField('cep', value),
                      ),
                    )  
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    child: Observer(builder: (_) =>
                      TextFormField(
                        controller: controllers['email'],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), 
                            labelText: 'E-mail', 
                            errorText: formStore.formErrors['email']
                        ),
                      //  onChanged: (value) => formStore.setField('email', value),
                      )
                    )  
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Observer(builder: (_) =>
                      TextFormField(                  
                        controller: controllers['contato'],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), 
                          labelText: 'contato',
                          errorText: formStore.formErrors['contato']
                        ),
                       // onChanged: (value) => formStore.setField('contato', value),  
                      ),
                    )  
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Observer(builder: (_) =>
                      TextFormField(
                        controller: controllers['numero'],
                        keyboardType: TextInputType.numberWithOptions(),
                        //inputFormatters: [
                          //MaskTextInputFormatter(
                            //mask: '## #####-####',)
                        //],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), 
                          labelText: 'Numero',
                          errorText: formStore.formErrors['numero']
                        ),
                       // onChanged: (value) => formStore.setField('numero', value),
                      ),
                    )  
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(builder: (_) => 
                    ElevatedButton(
                      onPressed: resetForm,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(15),
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 20,
                          )
                      ),
                      child: Text('CANCELAR'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Observer(builder: (_) =>
                    ElevatedButton(
                       onPressed: () {
                        formStore.validateAllFields();
                        if (formStore.isFormValid) {
                          log("salvou");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.all(15),
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(fontSize: 20)
                      ),
                      child: Text('SALVAR')
                    )
                  )  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
