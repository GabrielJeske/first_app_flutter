import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Colors.cyan[50],
       child: Column( 
              children: [
                SizedBox(height: 25),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Inicio'),
                   onTap: () {
                        Get.toNamed('/');
                      },
                ),
                ExpansionTile(title: Text('Clientes'),
                leading: Icon(Icons.person),
                  children: [
                    ListTile(
                      leading: Icon(Icons.add) ,
                      title: Text('Cadastro'),  
                      onTap: () {
                        Get.toNamed('/clientes/cadastro');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.search),
                      title: Text('Consulta'),  
                    ),
                    ListTile(
                      leading: Icon(Icons.remove_circle_outline_rounded),
                      title: Text('Exclusao'),  
                    ),
                  ],
                ),
                ExpansionTile(title: Text('Produtos'),
                leading: Icon(Icons.shopping_bag_outlined),
                  children: [
                    ListTile(
                      leading: Icon(Icons.add) ,
                      title: Text('Cadastro'),  
                    ),
                    ListTile(
                      leading: Icon(Icons.search),
                      title: Text('Consulta'),  
                    ),
                    ListTile(
                      leading: Icon(Icons.remove_circle_outline_rounded),
                      title: Text('Exclusao'),  
                    ),
                  ],
                ),
                Expanded(child: Container()),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Configuracoes'),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sair'),
                )
              ],
        ),
      );
  }
}