
import 'package:flutter/material.dart';

import '../screens/expediente_screen.dart';
import '../screens/home_screen.dart';
import '../useless/registro2_screen.dart';
import '../screens/registro_screen.dart';


class DrawerWidget extends StatefulWidget{

  @override
  final double height;

  DrawerWidget(this.height);


  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
        elevation: 30,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: widget.height*0.1, bottom: 10),
              child: const Text('Rehabilit', 
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900, color: Colors.blue)
              )
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: const Text('Cynthia Aranda Ramirez', 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: Colors.black, fontFamily: 'GreatVibes')
              )
            ),
            const Divider(
              height: 1,
              color: Colors.blue,
            ),
            ListTile(
              title: const Text('Principal', 
              style: TextStyle(fontWeight: FontWeight.w800),
              ),
              leading: const Icon(Icons.home_filled),
              iconColor: Colors.blue,
              onTap: () {
                 Navigator.pop(context);
                 Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            const Divider(
              height: 1,
              color: Colors.blue,
            ),
            ListTile(
              title: const Text('Nuevo paciente (#1)', style: TextStyle(fontWeight: FontWeight.bold),),
              leading: Icon(Icons.personal_injury_outlined),
              iconColor: Colors.blue,
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => RegistroScreen()),
                );
              },
            ),
            const Divider(
              height: 1,
              color: Colors.blue,
            ),
            ListTile(
              title: const Text('Expedientes', style: TextStyle(fontWeight: FontWeight.bold),),
              leading: const Icon(Icons.folder_shared_outlined),
              iconColor: Colors.blue,
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => ExpedienteScreen()),
                );
              },
            ),
            const Divider(
              height: 1,
              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.only(top: widget.height*0.4,),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color> (Colors.blue)),
                onPressed: (){ 
                }, 
                child: const Text('Cerrar sesión')
                ),
            )
        ]
        ),
      );
  }
}