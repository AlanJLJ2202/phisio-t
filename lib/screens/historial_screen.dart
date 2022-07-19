import 'package:flutter/material.dart';
import '../models/paciente.dart';
import '../widgets/drawer.dart';

class HistorialScreen extends StatefulWidget{

  //final Paciente paciente;
  //HistorialScreen(this.paciente);

  @override
  State<HistorialScreen> createState() => _HistorialScreenState();
}

class _HistorialScreenState extends State<HistorialScreen> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: width < 450 ? const Text(
          'Rehabilit',
          style: TextStyle(fontWeight: FontWeight.w800),
        ) : const Text(
          'Rehabilit - Fisioterapia Integral y Deporte',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      drawer: DrawerWidget(height),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(
                  Icons.person_pin_outlined,
                  size: 100,
                  color: Colors.teal,
                ),
              ),
              Container(
                child: Text(
                    'Alan Jesus Lopez Jacinto',
                   style: TextStyle(fontSize: 35),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}