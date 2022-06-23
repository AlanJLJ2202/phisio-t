import 'package:flutter/material.dart';
import 'package:phisio_t/screens/registro2_screen.dart';
import 'package:phisio_t/screens/registro_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Fisioterapeuta',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "Raleway",
              bodyColor: Colors.black,
              displayColor: Colors.black
            )

      ),
      
      home: Registro2Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}




