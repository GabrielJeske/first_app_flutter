import 'dart:developer';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:first_project/core/views/myaapbar.dart';
import 'package:first_project/core/views/mydrawer.dart';
import 'package:first_project/stores/form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class CadastroPJ extends StatefulWidget {
  const CadastroPJ({super.key});

  @override
  State<CadastroPJ> createState() => _CadastroPJState();
}

class _CadastroPJState extends State<CadastroPJ> {
  final formStore = Get.find<FormStore>();
  
  // Criando um Map para armazenar os controladores de cada campo
  final Map<String, TextEditingController> controllers = {};

  final List<String> campos = [
    'razaosocial', 'fantasia', 'cnpj', 'email', 'endereco', 'bairro', 'cep', 'n', 'contato', 'numero', 'contribuinte', 'ie'
  ];
  
  
  
  @override
  void initState() {
    super.initState();
    for (var campo in campos) {
      controllers[campo] = TextEditingController();

      controllers[campo]!.addListener(() {
        formStore.setField(campo, controllers[campo]!.text);
      });
    }
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void resetForm() {
    formStore.resetForm();
    for (var campo in controllers.keys) {
      controllers[campo]!.text = '';
    }
  }

  var maskCnpj = MaskTextInputFormatter(mask: '##.###.###/####-##', filter: { "#": RegExp(r'[0-9]') });
  var maskCep = MaskTextInputFormatter(mask: '#####-###', filter: { "#": RegExp(r'[0-9]') });
  var maskNumero = MaskTextInputFormatter(mask: '(##) #####-####', filter: { "#": RegExp(r'[0-9]') });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: CustomAppBar(title: 'Clientes'),
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
                        controller: controllers['razaosocial'],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), 
                          errorText: formStore.formErrors['razaosocial'],
                          labelText: 'Razao Social'
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
                  Flexible(
                    child: Observer(builder: (_) =>
                      TextFormField(
                        controller: controllers['fantasia'],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(), 
                          errorText: formStore.formErrors['fantasia'],
                          labelText: 'Nome Fantasia'
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
                  Flexible(
                    child: Observer(builder: (_) => 
                      TextFormField(
                        controller: controllers['cnpj'],
                        inputFormatters: [maskCnpj],
                        keyboardType: TextInputType.numberWithOptions(),                      
                        decoration: InputDecoration(
                          errorText: formStore.formErrors['cnpj'],
                          border: OutlineInputBorder(), 
                          labelText: 'CNPJ'                          
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
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Contribuinte', 
                          border: OutlineInputBorder(),
                          errorText: formStore.formErrors['contribuinte'],
                        ),
                        value: formStore.formValues['Contribuinte'] == '' ?  null: formStore.formValues['Contribuinte'],
                        items: ['Contribuinte', 'Não Contribuinte', 'Isento'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null){
                            formStore.setField('contribuinte', newValue ?? '');
                          }                   
                        },
                      )
                    )
                  ),
                SizedBox(width: 10),
                SizedBox(
                    width: 150,
                    child: Observer(builder: (_) =>
                      TextFormField(
                        controller: controllers['ie'],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), 
                            labelText: 'IE', 
                            errorText: formStore.formErrors['ie']
                        ),
                        //onChanged: (value) => formStore.setField('n', value),
                      ),
                    )
                  )  
                  
                ]            
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
                        inputFormatters: [maskCep],
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
                        inputFormatters: [maskNumero],
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
