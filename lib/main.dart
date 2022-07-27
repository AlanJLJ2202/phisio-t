import 'package:flutter/material.dart';
import 'package:phisio_t/screens/expediente_screen.dart';
import 'package:phisio_t/screens/historial_screen.dart';
import 'package:phisio_t/useless/registro2_screen.dart';
import 'package:phisio_t/screens/registro_screen.dart';
import 'package:phisio_t/utils/colores.dart';

import 'screens/agenda_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      title: 'Fisioterapeuta',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colores.celeste,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: "Raleway",
                //bodyColor: Colors.white,
                //displayColor: Colors.black
              )),
      home: AgendaScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
