import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phisio_t/screens/registro2_screen.dart';
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
        title: const Text('Rehabilit', style: TextStyle(fontWeight: FontWeight.w800),),
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
              Divider(
              height: 1,
              color: Colors.blue,
            ),
            ListTile(
              title: const Text('Nuevo paciente', style: TextStyle(fontWeight: FontWeight.bold),),
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
            ListTile(
              title: const Text('Nuevo diseño', style: TextStyle(fontWeight: FontWeight.bold),),
              leading: const Icon(Icons.personal_injury_outlined),
              iconColor: Colors.blue,
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => Registro2Screen()),
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
      body: ListView(
        children: [
          Column(
            children: [
            Container(
              margin: EdgeInsets.only(top: height*0.1),
              child: const Text('Buscar Paciente: ', 
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)
              )
              ),
             Container(
              height: 300,
              width: 800,
              color: Colors.blue,
              child: Column(children: [
                
              ]),
             )
          ]),
        ],
      )
    );
  }
}