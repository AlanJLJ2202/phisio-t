
import 'package:flutter/material.dart';
import 'package:phisio_t/screens/agenda_screen.dart';

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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.blue.shade100,
                Colors.blue.shade200,
                Colors.blue,
              ]
            )
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: widget.height*0.1, bottom: 10),
                child: const Text('Rehabilit',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.blue)
                )
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: const Text('Cynthia Aranda Ramirez',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200, color: Colors.black, fontFamily: 'GreatVibes')
                )
              ),
              const Divider(
                height: 1,
                color: Colors.blue,
              ),
              ListTile(
                title: const Text('Principal',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
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
                title: const Text('Nuevo paciente', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
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
                title: const Text('Agenda', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                leading: const Icon(Icons.calendar_month_sharp),
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.pop(context);
                   Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => AgendaScreen()),
                  );
                },
              ),
              const Divider(
                height: 1,
                color: Colors.blue,
              ),
              Container(
                margin: EdgeInsets.only(top: widget.height*0.4),
                width: 75,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color> (Colors.red),
                      elevation: MaterialStateProperty.all(25),
                      //shadowColor: MaterialStateProperty.all<Color> (Colors.blue)
                  ),
                  onPressed: (){
                  },
                  child: Icon(Icons.highlight_off_rounded)
                  ),
              )
          ]
          ),
        ),
      );
  }
}