import 'package:first_project/routes.dart';
import 'package:first_project/stores/form_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main (){
    Get.put(FormStore());
    runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: '/',
        getPages: Routes.routes,
    );
  }
}