import 'dart:ui';

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
        title: const Text('Expediente', style: TextStyle(fontWeight: FontWeight.w800),),
      ),
      drawer: DrawerWidget(height),
      body: ListView(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: height*0.05),
                    height: height * 0.08,
                    width: width*0.3,
                    
                    decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 4),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(
                          4.0,
                          4.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 3.0,
                      )
                    ]),
                    child: const Center(child: Text('Maria Elena Jacinto Mendez',
                     style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w800,
                      fontSize: 25
                      ),
                    )),
                  ),
                Container(
                    height: height * 0.75,
                    width: width*0.6,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 4),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(
                          4.0,
                          4.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 3.0,
                      )
                    ]),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Container(
                          height: 500,
                          width: 400,
                          child: Column(children: [
                            const Text('Preguntas frecuentes',
                              style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize:20
                            ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              height: 450,
                              width: 400,
                              
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue)
                              ),
                            )
                          ]),
                        ),
                        Container(
                          height: 500,
                          width: 400,
                          child: Column(children: [

                            Text('Signos vitales',
                              style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize:20
                            ),),
                            Container(
                              margin: EdgeInsets.only(top: 15, bottom: 59),
                              height: 200,
                              width: 350,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue)
                              ), 
                            ),


                            Text('Nivel de inflamacion o edema',
                              style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize:20
                            ),),
                            Container(
                               margin: EdgeInsets.only(top: 15, bottom: 15),
                              height: 150,
                              width: 350,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue)
                            ))

                          ]),
                        )
                      ]),
                    ),
                  ), 
            ]),
          ),
        ],
      )
    );
  }

}