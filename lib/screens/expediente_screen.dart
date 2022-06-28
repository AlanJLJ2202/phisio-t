import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phisio_t/useless/registro2_screen.dart';
import 'package:phisio_t/screens/registro_screen.dart';
import 'package:phisio_t/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colores.dart';
import 'home_screen.dart';



class ExpedienteScreen extends StatefulWidget{
  @override
  State<ExpedienteScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ExpedienteScreen> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery. of(context).size.width ;
    double height = MediaQuery. of(context).size.height;
    

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Rehabilit', style: TextStyle(fontWeight: FontWeight.w800),),
      ),
      drawer: DrawerWidget(height),
      body: ListView(
        children: [
          Column(
            children: [
              
          ]),
        ],
      )
    );
  }

}