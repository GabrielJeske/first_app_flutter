import 'package:first_project/core/views/clientes.dart';
import 'package:first_project/core/views/home.dart';
import 'package:get/get.dart';

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/clientes/cadastro', page: () => Clientes()),
  ];

}