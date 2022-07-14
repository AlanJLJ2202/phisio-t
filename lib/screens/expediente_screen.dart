import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phisio_t/widgets/drawer.dart';


class ExpedienteScreen extends StatefulWidget {
  @override
  State<ExpedienteScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ExpedienteScreen> {
  double _currentSliderValue = 0;
  double _currentSliderValue2 = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final TextEditingController _descripcion = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'Expediente / 2022-07-12',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        drawer: DrawerWidget(height),
        body: width >= 810 ? Container(
          child: Center(
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: height * 0.05),
                          height: height * 0.08,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.blue, width: 4),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
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
                          child: const Center(
                              child: Text(
                            'Maria Elena Jacinto Mendez',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          )),
                        ),
                        Container(
                          height: 475,
                          width: 850,
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
                              ],
                            /*gradient: LinearGradient(
                                colors: [
                                  Colors.pinkAccent,
                                  Colors.purple,
                                  Colors.purpleAccent,
                                  Colors.deepPurpleAccent,
                                  //Colors.blue.shade300,
                                  //add more colors for gradient
                                ],
                                begin: Alignment.topLeft, //begin of the gradient color
                                end: Alignment.bottomRight, //end of the gradient color
                                stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                              //set the stops number equal to numbers of color
                            ),*/


                          ),
                          child: Container(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 500,
                                        width: 400,
                                        child: Column(children: [
                                          /*Expanded(
                                              flex: 1,
                                              child: Container(
                                                                                            alignment: Alignment.centerLeft,
                                                margin: EdgeInsets.only(top: 10, left: 10),
                                                child: Text(
                                                  '2022/06/30',
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.w800,
                                                      fontSize: 20),
                                                ),
                                              )),*/
                                          Container(
                                              margin: EdgeInsets.only(top: 15),
                                              child: const Text(
                                                'Descripcion',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 20),
                                              ),
                                            ),

                                          Container(
                                              margin: EdgeInsets.only(top: 15, left: width*0.01, bottom: 5),
                                              height: 330,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.blue)),
                                              child: TextField(
                                                controller: _descripcion,
                                                keyboardType: TextInputType.multiline,
                                                minLines: null,
                                                maxLines: null,
                                                expands: true,
                                                decoration: const InputDecoration(
                                                  contentPadding: EdgeInsets.all(15),
                                                ),
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
                                              ),
                                            ),
                                           boton('Guardar', Colors.green, 13, () {})
                                        ]),
                                      ),
                                      Container(
                                        height: 500,
                                        width: 400,

                                        child: Column(children: [

                                          Container(
                                            margin: const EdgeInsets.only(top: 15),
                                            child: const Text(
                                              'Signos vitales',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(bottom: 15),
                                            margin: EdgeInsets.only(top: 15, bottom: 10),
                                            height: 150,
                                            width: 350,
                                            decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: Colors.blue)),
                                            child: Column(

                                                children: [

                                              Container(
                                                    margin: EdgeInsets.only(top: 1),
                                                    height: 40,
                                                    width: 200,

                                                    //color: Colors.green,
                                                    child: const TextField(
                                                      //scrollPadding: EdgeInsets.only(bottom: 10),
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                                      decoration: InputDecoration(
                                                        labelText: 'TA',
                                                        floatingLabelAlignment: FloatingLabelAlignment.center,
                                                        labelStyle: TextStyle(
                                                            color: Colors.blue,
                                                            fontWeight: FontWeight.w900),
                                                        contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                                        //contentPadding: EdgeInsets.all(5)
                                                      ),
                                                    )),

                                              Container(
                                                   margin: EdgeInsets.only(top: 1),
                                                    height: 40,
                                                    width: 200,
                                                    child: const TextField(
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                                      decoration: InputDecoration(
                                                        labelText: 'FC',
                                                        floatingLabelAlignment: FloatingLabelAlignment.center,
                                                        labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
                                                        contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                                      ),
                                                    )),

                                                  Container(
                                                    margin: EdgeInsets.only(top: 1),
                                                      height: 40,
                                                      width: 200,
                                                      child: const TextField(
                                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                                        decoration: InputDecoration(
                                                          labelText: 'O2',
                                                          floatingLabelAlignment: FloatingLabelAlignment.center,
                                                          labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
                                                          contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                                        ),
                                                      )),

                                            ]),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: const Text(
                                              'Nivel de Dolor',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 15, bottom: 10),
                                            height: 35,
                                            width: 350,
                                            decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.blue),
                                            ),
                                            child: Slider(
                                              value: _currentSliderValue2,
                                              max: 100,
                                              divisions: 10,
                                              activeColor: Colors.red,
                                              inactiveColor: Colors.green,
                                              label: _currentSliderValue2
                                                  .round()
                                                  .toString(),
                                              onChanged: (double value) {
                                                setState(() {
                                                  _currentSliderValue2 = value;
                                                });
                                              },
                                            ),
                                          ),
                                          const Text(
                                            'Nivel de inflamación o Edema',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 15, bottom: 5),
                                            height: 35,
                                            width: 350,
                                            decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.blue),
                                            ),
                                            child: Slider(
                                              value: _currentSliderValue,
                                              max: 100,
                                              divisions: 10,
                                              activeColor: Colors.red,
                                              inactiveColor: Colors.green,
                                              label: _currentSliderValue
                                                  .round()
                                                  .toString(),
                                              onChanged: (double value) {
                                                setState(() {
                                                  _currentSliderValue = value;
                                                });
                                              },
                                            ),
                                          ),
                                          boton('Cancelar', Colors.red, 50, () {

                                          })

                                        ]),
                                      )
                                    ]),

                          ),
                        ),

                      ]),
                ),
              ),
        )
            :

              ListView(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: height * 0.05),
                          height: height * 0.08,
                          width: width > 810 ? 400 : 430,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.blue, width: 4),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
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
                          child: const Center(
                              child: Text(
                                'Maria Elena Jacinto Mendez',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20),
                              )),
                        ),
                        Container(
                          height: 918,
                          width: width > 810 ? 850 : 430,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 4),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),

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
                            ],
                            /*gradient: LinearGradient(
                                    colors: [
                                      Colors.pinkAccent,
                                      Colors.purple,
                                      Colors.purpleAccent,
                                      Colors.deepPurpleAccent,
                                      //Colors.blue.shade300,
                                      //add more colors for gradient
                                    ],
                                    begin: Alignment.topLeft, //begin of the gradient color
                                    end: Alignment.bottomRight, //end of the gradient color
                                    stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                                  //set the stops number equal to numbers of color
                                ),*/


                          ),
                          child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 890,
                                    width: 400,
                                    child: Column(children: [
                                      /*Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                                                                alignment: Alignment.centerLeft,
                                                    margin: EdgeInsets.only(top: 10, left: 10),
                                                    child: Text(
                                                      '2022/06/30',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight: FontWeight.w800,
                                                          fontSize: 20),
                                                    ),
                                                  )),*/
                                      Container(
                                        //margin: EdgeInsets.only(top: 15),
                                        child: const Text(
                                          'Descripcion',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20),
                                        ),
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(top: 15, left: width*0.01, bottom: 5, right: width*0.01),
                                        height: 330,
                                        width: 400,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.blue)),
                                        child: TextField(
                                          controller: _descripcion,
                                          keyboardType: TextInputType.multiline,
                                          minLines: null,
                                          maxLines: null,
                                          expands: true,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(15),
                                          ),
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: const Text(
                                          'Nivel de Dolor',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 15, bottom: 10),
                                        height: 35,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.blue),
                                        ),
                                        child: Slider(
                                          value: _currentSliderValue2,
                                          max: 100,
                                          divisions: 10,
                                          activeColor: Colors.red,
                                          inactiveColor: Colors.green,
                                          label: _currentSliderValue2
                                              .round()
                                              .toString(),
                                          onChanged: (double value) {
                                            setState(() {
                                              _currentSliderValue2 = value;
                                            });
                                          },
                                        ),
                                      ),
                                      const Text(
                                        'Nivel de inflamación o Edema',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 15, bottom: 5),
                                        height: 35,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.blue),
                                        ),
                                        child: Slider(
                                          value: _currentSliderValue,
                                          max: 100,
                                          divisions: 10,
                                          activeColor: Colors.red,
                                          inactiveColor: Colors.green,
                                          label: _currentSliderValue
                                              .round()
                                              .toString(),
                                          onChanged: (double value) {
                                            setState(() {
                                              _currentSliderValue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 15),
                                        child: const Text(
                                          'Signos vitales',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        margin: EdgeInsets.only(top: 15, bottom: 20),
                                        height: 150,
                                        width: 350,
                                        decoration: BoxDecoration(
                                            border:
                                            Border.all(color: Colors.blue)),
                                        child: Column(

                                            children: [

                                              Container(
                                                  margin: EdgeInsets.only(top: 1),
                                                  height: 40,
                                                  width: 200,

                                                  //color: Colors.green,
                                                  child: const TextField(
                                                    //scrollPadding: EdgeInsets.only(bottom: 10),
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                                    decoration: InputDecoration(
                                                      labelText: 'TA',
                                                      floatingLabelAlignment: FloatingLabelAlignment.center,
                                                      labelStyle: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight: FontWeight.w900),
                                                      contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                                      //contentPadding: EdgeInsets.all(5)
                                                    ),
                                                  )),

                                              Container(
                                                  margin: EdgeInsets.only(top: 1),
                                                  height: 40,
                                                  width: 200,
                                                  child: const TextField(
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                                    decoration: InputDecoration(
                                                      labelText: 'FC',
                                                      floatingLabelAlignment: FloatingLabelAlignment.center,
                                                      labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
                                                      contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                                    ),
                                                  )),

                                              Container(
                                                  margin: EdgeInsets.only(top: 1),
                                                  height: 40,
                                                  width: 200,
                                                  child: const TextField(
                                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                                    decoration: InputDecoration(
                                                      labelText: 'O2',
                                                      floatingLabelAlignment: FloatingLabelAlignment.center,
                                                      labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
                                                      contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                                    ),
                                                  )),

                                            ]),
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          boton('Guardar', Colors.green, 13, () {}),

                                          boton('Cancelar', Colors.red, 50, () {

                                          })
                                        ],
                                      ),
                                    ]),
                                  ),
                                ]),
                        )
                      ]),


                ],
              ),

    );
  }

  Widget boton(String label, Color color, double ancho, Function() funcion) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        height: 40,
        width: 150,
        child: ElevatedButton(
          child: Text('${label}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          onPressed: funcion,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
          ),
        ));
  }
}
