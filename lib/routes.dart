import 'package:first_project/core/views/cadastro.dart';
import 'package:first_project/core/views/cadastro_pj.dart';
import 'package:first_project/core/views/clientes.dart';
import 'package:first_project/core/views/home.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/clientes/cadastro', page: () => Cadastro()),
    GetPage(name: '/clientes/cadastro/ps', page: () => Clientes()),
    GetPage(name: '/clientes/cadastro/pj', page: () => CadastroPJ())
  ];

}