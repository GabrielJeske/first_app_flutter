import 'package:first_project/core/views/myaapbar.dart';
import 'package:first_project/core/views/mydrawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'SiFrA',
      home: Scaffold(
      appBar: const CustomAppBar(title: 'SpeedCode'),
      drawer: CustomDrawer(),
      )
    );
  }
}