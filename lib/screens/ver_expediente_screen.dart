import 'dart:ui';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:phisio_t/screens/historial_screen.dart';
import 'package:phisio_t/widgets/drawer.dart';

import '../models/expediente.dart';
import '../models/paciente.dart';
import 'home_screen.dart';


class VerExpedienteScreen extends StatefulWidget {

  final Paciente paciente;
  final Expediente expediente;


  VerExpedienteScreen(this.paciente, this.expediente);

  @override
  State<VerExpedienteScreen> createState() => _HomeScreenState(expediente);
}

class _HomeScreenState extends State<VerExpedienteScreen> {
  double _nivel_dolorValue = 0;
  double _nivel_inflamacionValue = 0;

  final now = new DateTime.now();

  final Expediente expediente;

  final TextEditingController txtDescripcion = TextEditingController();
  final TextEditingController txtTA = TextEditingController();
  final TextEditingController txtFC = TextEditingController();
  final TextEditingController txt02 = TextEditingController();

  _HomeScreenState(this.expediente){
    print('ta');
    print(expediente.signo_ta.toString());

    print('fc');
    print(expediente.signo_fc.toString());

    print('o2');
    print(expediente.signo_o2.toString());

    txtDescripcion.text = expediente.descripcion!;

    if(expediente.signo_ta != '' || expediente.signo_ta != null){
      txtTA.text = expediente.signo_ta!;
    }
    if(expediente.signo_fc != '' || expediente.signo_fc != null){
      txtFC.text = expediente.signo_fc!;
    }
    if(expediente.signo_o2 != '' || expediente.signo_o2 != null){
      txt02.text = expediente.signo_o2!;
    }

    _nivel_dolorValue = double.parse(expediente.nivel_dolor);

    _nivel_inflamacionValue = double.parse(expediente.nivel_inflamacion);

  }

  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Expediente / ${now.year}-${now.month}-${now.day}',
          style: const TextStyle(fontWeight: FontWeight.w800),
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
                    child: Center(
                        child: Text(
                          widget.paciente.nombre,
                          style: const TextStyle(
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

                    ),
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 500,
                              width: 400,
                              child: Column(children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 15),
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
                                    controller: txtDescripcion,
                                    keyboardType: TextInputType.multiline,
                                    minLines: null,
                                    maxLines: null,
                                    expands: true,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(15),
                                    ),
                                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
                                  ),
                                ),
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
                                  padding: const EdgeInsets.only(bottom: 15),
                                  margin: const EdgeInsets.only(top: 15, bottom: 10),
                                  height: 150,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.blue)),
                                  child: Column(

                                      children: [

                                        Container(
                                            margin: const EdgeInsets.only(top: 1),
                                            height: 40,
                                            width: 200,

                                            //color: Colors.green,

                                            child: TextField(
                                              enabled: false,
                                              //scrollPadding: EdgeInsets.only(bottom: 10),
                                              controller: txtTA,
                                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                              decoration: const InputDecoration(
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
                                            margin: const EdgeInsets.only(top: 1),
                                            height: 40,
                                            width: 200,
                                            child: TextField(
                                              enabled: false,
                                              controller: txtFC,
                                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                              decoration: const InputDecoration(
                                                labelText: 'FC',
                                                floatingLabelAlignment: FloatingLabelAlignment.center,
                                                labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
                                                contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                              ),
                                            )),

                                        Container(
                                            margin: const EdgeInsets.only(top: 1),
                                            height: 40,
                                            width: 200,
                                            child: TextField(
                                              enabled: false,
                                              controller: txt02,
                                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                              decoration: const InputDecoration(
                                                labelText: 'O2',
                                                floatingLabelAlignment: FloatingLabelAlignment.center,
                                                labelStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
                                                contentPadding: const EdgeInsets.only(left: 10, bottom: 10),
                                              ),
                                            )),

                                      ]),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: const Text(
                                    'Nivel de Dolor',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 15, bottom: 10),
                                  height: 35,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.blue),
                                  ),
                                  child: Slider(
                                    value: _nivel_dolorValue,
                                    max: 100,
                                    divisions: 10,
                                    activeColor: Colors.red,
                                    inactiveColor: Colors.green,
                                    label: _nivel_dolorValue
                                        .round()
                                        .toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _nivel_dolorValue = value;
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
                                    value: _nivel_inflamacionValue,
                                    max: 100,
                                    divisions: 10,
                                    activeColor: Colors.red,
                                    inactiveColor: Colors.green,
                                    label: _nivel_inflamacionValue
                                        .round()
                                        .toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _nivel_inflamacionValue = value;
                                      });
                                    },
                                  ),
                                ),

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
                  child: Center(
                      child: Text(
                        widget.paciente.nombre,
                        style: const TextStyle(
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

                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 890,
                          width: 400,
                          child: Column(children: [

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
                                controller: txtDescripcion,
                                enabled: false,
                                keyboardType: TextInputType.multiline,
                                minLines: null,
                                maxLines: null,
                                expands: true,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                ),
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text(
                                'Nivel de Dolor',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15, bottom: 10),
                              height: 35,
                              width: 350,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.blue),
                              ),
                              child: Slider(
                                value: _nivel_dolorValue,
                                max: 100,
                                divisions: 10,
                                activeColor: Colors.red,
                                inactiveColor: Colors.green,
                                label: _nivel_dolorValue
                                    .round()
                                    .toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    _nivel_dolorValue = value;
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
                                value: _nivel_inflamacionValue,
                                max: 100,
                                divisions: 10,
                                activeColor: Colors.red,
                                inactiveColor: Colors.green,
                                label: _nivel_inflamacionValue
                                    .round()
                                    .toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    _nivel_inflamacionValue = value;
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
                              padding: const EdgeInsets.only(bottom: 15),
                              margin: const EdgeInsets.only(top: 15, bottom: 20),
                              height: 150,
                              width: 350,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.blue)),
                              child: Column(

                                  children: [

                                    Container(
                                        margin: const EdgeInsets.only(top: 1),
                                        height: 40,
                                        width: 200,

                                        //color: Colors.green,
                                        child: TextField(
                                          //scrollPadding: EdgeInsets.only(bottom: 10),
                                          controller: txtTA,
                                          enabled: false,
                                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                          decoration: const InputDecoration(
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
                                        margin: const EdgeInsets.only(top: 1),
                                        height: 40,
                                        width: 200,
                                        child: TextField(
                                          controller: txtFC,
                                          enabled: false,
                                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                          decoration: const InputDecoration(
                                            labelText: 'FC',
                                            floatingLabelAlignment: FloatingLabelAlignment.center,
                                            labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
                                            contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                          ),
                                        )),

                                    Container(
                                        margin: const EdgeInsets.only(top: 1),
                                        height: 40,
                                        width: 200,
                                        child: TextField(
                                          controller: txt02,
                                          enabled: false,
                                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                          decoration: const InputDecoration(
                                            labelText: 'O2',
                                            floatingLabelAlignment: FloatingLabelAlignment.center,
                                            labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
                                            contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                                          ),
                                        )),

                                  ]),
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




}
