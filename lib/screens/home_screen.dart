import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phisio_t/screens/registro_screen.dart';



class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery. of(context).size.width ;
    double height = MediaQuery. of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text('Rehabilit', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),),
      ),
      drawer: Drawer(
        elevation: 30,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height*0.1, bottom: 40),
              child: const Text('Rehabilit', 
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Colors.blue)
              )
              ),
              Divider(
              height: 1,
              color: Colors.blue,
            ),
            ListTile(
              title: const Text('Principal'),
              leading: const Icon(Icons.home_filled),
              iconColor: Colors.blue,
              onTap: () {
                //Navigator.defaultRouteName
              },
            ),
              Divider(
              height: 1,
              color: Colors.blue,
            ),
            ListTile(
              title: const Text('Pacientes'),
              leading: const Icon(Icons.personal_injury_outlined),
              iconColor: Colors.blue,
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => RegistroScreen()),
                );
              },
            ),
            Divider(
              height: 1,
              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.only(top: height*0.5),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color> (Colors.blue)),
                onPressed: (){ 
                }, 
                child: const Text('Cerrar sesión')
                ),
            )
        ]
        ),
      ),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.only(top: height*0.1),
          child: const Text('Nuevo Paciente', 
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)
          )
          ),
      ])
    );
  }
}