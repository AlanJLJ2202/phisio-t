import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phisio_t/screens/registro2_screen.dart';
import 'package:phisio_t/screens/registro_screen.dart';



class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String visible = "falso";
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
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900, color: Colors.blue)
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
              title: const Text('Nuevo paciente (#1)', style: TextStyle(fontWeight: FontWeight.bold),),
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
              title: const Text('Nuevo paciente (#2)', style: TextStyle(fontWeight: FontWeight.bold),),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: height*0.08, left: width*0.05),
                  child: const Text('Buscar Paciente: ', 
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)
                  )
                  ),
                  Container(
                  margin: EdgeInsets.only(top: height*0.085),
                  child: inputField('', 300),
                  
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height*0.085),
                    child: IconButton(
                      onPressed: (){
                        Future.delayed(const Duration(milliseconds: 350), () {
                         setState(() {
                          //Cuando se le da en el icono de buscar, se hace visible la lista maquetada

                          visible = 'visible';
                        }); 
                      
                        });
                              
                        
                        
                      }, 
                      icon: Icon(Icons.search_rounded, color: Colors.blue,),
                      iconSize: 50,
                ))
              ],
            ),
            Visibility(
              visible: visible == 'visible' ? true : false,
              child: SizedBox(
                height: height*0.6,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                     children: [
                       Container(
                        margin: EdgeInsets.only(left: 50),
                        child: infoPaciente(width, height, 'Alan Jesus Lopez Jacinto', 21, "4761072633", "Morelos #117, Purisima del Rincón")
                        ),
                        infoPaciente(width, height, 'Mario Valadez Quiroz', 21, "476104545", "Cañada de Negros"),
                       infoPaciente(width, height, 'Gerson Luis Lopez Jacinto', 26, "4761072633", "San Miguel, León"),
                       infoPaciente(width, height, 'Maria Elena Jacinto Mendez', 21, "4761072232", "Dolores"),
                     ],
                   ),
              ),
            ),
             
          ]),
        ],
      )
    );
  }

Widget inputField(String label, double largo){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              height: 35,
              width: largo,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1),
              borderRadius: const BorderRadius.all(
                    Radius.circular(14),
                  ),
              ),
              child: const TextField(
                textAlign: TextAlign.center,
              ),
            ),
        ],
    );
  }

  Widget infoPaciente(double width, double height, String nombre, int edad, String telefono, String ubicacion){
    return Container(
      margin: EdgeInsets.only(top: height*0.08, right: 50),
      height: height*0.5,
      width: width*0.4,
      decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.01),
                border: Border.all(color: Colors.blue, width: 4),
                 borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                 
                ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, left: 30),
            child: Text(nombre, style: TextStyle(fontSize: 35, color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
           Container(
            margin: EdgeInsets.only(left: 30),
            child: Text('Edad: ${edad} años', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
          ),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 30),
                child: IconButton(
                  iconSize: 40,
                  icon: Icon(
                    Icons.whatsapp_outlined, 
                    color: Colors.green,
                    ),
                    onPressed: (){}
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 5, right: 15),
                child: Text('${telefono}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Icon(
                  Icons.location_pin, 
                  color: Colors.red,
                  size: 40
                  ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 5, right: 15),
                child: Text('${ubicacion}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boton('Expediente', Colors.green, 60),
            ],
          ),
      ]),
    );
  }


Widget boton(String label, Color color, double ancho){
  return Container(
    margin: EdgeInsets.only(top: 50),
    height: 50,
    width: 150,
    child: ElevatedButton(
      child: 
      Text('${label}', style: TextStyle(fontSize: 20),),
      onPressed: (){},
      style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      )
    );
}

}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}