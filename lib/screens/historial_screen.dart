import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phisio_t/screens/expediente_screen.dart';
import 'package:phisio_t/screens/home_screen.dart';
import 'package:phisio_t/screens/ver_expediente_screen.dart';
import '../models/expediente.dart';
import '../models/paciente.dart';
import '../widgets/drawer.dart';

class HistorialScreen extends StatefulWidget{

  final Paciente paciente;
  HistorialScreen(this.paciente);

  @override
  State<HistorialScreen> createState() => _HistorialScreenState();
}

class _HistorialScreenState extends State<HistorialScreen> {

  List<Expediente> lista_expedientes = [];

  @override
  void initState() {
    super.initState();
    _historial(widget.paciente);
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
        title: width < 450 ? const Text(
          'Rehabilit',
          style: TextStyle(fontWeight: FontWeight.w800),
        ) : const Text(
          'Rehabilit - Fisioterapia Integral y Deporte',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      drawer: DrawerWidget(height),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Icon(
                  Icons.account_circle_sharp,
                  size: 100,
                  color: Colors.blue,
                ),
              ),

              Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                        '${widget.paciente.nombre}',
                       style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
                    ),
                  ),

              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () {

                    showDialog(context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          '¿Estás segur@ que deseas eliminar el registro?', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        content: Text(
                          'También se eliminara su expediente', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Cancelar', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),),
                          ),
                          TextButton(
                            onPressed: (){
                              eliminar_paciente(widget.paciente);
                              Future.delayed(const Duration(milliseconds: 250), () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                              });
                            },
                            child: const Text(
                              'Aceptar', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    );

                  },
                  child: Text('Eliminar'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color> (Colors.red),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('Edad: ', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    child: Text(
                      '${widget.paciente.edad} años',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ),
                ],
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('Telefono: ', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.w600)),
                      ),
                      Container(
                        child: Text(
                          '${widget.paciente.telefono}',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
                        ),


                      ),
                    ],
                  ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('Ocupacion: ', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    child: Text(
                      '${widget.paciente.ocupacion}',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text('Direccion: ', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    child: Text(
                      '${widget.paciente.direccion}',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
                    ),


                  ),
                ],
              ),

              widget.paciente.enfermedad_cronica != '' ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text('Enfermedad Cronica: ', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    child: Text(
                      '${widget.paciente.enfermedad_cronica}',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
                    ),


                  ),
                ],
              ) : Container(),

              widget.paciente.otra_enfermedad != 'Sin Hipertensión, Sin Diabetes, Sin Art/Ost, Sin Enfermedad Pulmonar' ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text('Otra enfermedad: ', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    //margin: EdgeInsets.only(left: 200, right: 200),
                    child: Text(
                      '${widget.paciente.otra_enfermedad}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                    ),


                  ),
                ],
              ) : Container(),


              Container(
                margin: EdgeInsets.only(top: 20, bottom: 5),
                child: Text('Historial', style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 35, fontWeight: FontWeight.w600),),
              ),
              Container(
                width: 75,
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExpedienteScreen(widget.paciente)));
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color> (Colors.green),
                  ),
                ),
              ),
              lista_expedientes.length > 0 ? Column(

                children: List.generate(lista_expedientes.length, (index) {
                  return infoExpediente(lista_expedientes[index], context, width);
                }),

              ) : Container(
                child: Text('Aún no ingresa algun expediente de este paciente...', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),),
              )

            ],
          ),
        ],
      ),
    );
  }

  Widget infoExpediente(Expediente expediente, BuildContext context, double width){

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => VerExpedienteScreen(widget.paciente, expediente)));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 150,
          width: 360,
          decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrangeAccent, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),),
          child: Column(
            children: [
              Container(
                child: Text('${expediente.fecha}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(expediente.descripcion.length > 150 ? expediente.descripcion.substring(0, 150)+'...' : '${expediente.descripcion}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              )
            ],
          ),
      ),
    );
  }

  Future _historial(Paciente paciente) async {

    final data = {
      "paciente_id": int.parse(paciente.id),
    };

    print(data.entries);

    final response = await Dio().get("https://www.phisio-t.com/busqueda_historial.php", queryParameters: data);

    var datos = jsonDecode(response.data);
    print(datos);

    setState(() {
      lista_expedientes = List<Expediente>.from(datos.map((x) => Expediente.fromJson(x)));
    });

    print(lista_expedientes.asMap());

  }



  Future eliminar_paciente(Paciente paciente) async {

    final data = {
      "paciente_id": int.parse(paciente.id),
    };

    print(data.entries);

    await Dio().get("https://www.phisio-t.com/eliminar_paciente.php", queryParameters: data);

    /*var datos = jsonDecode(response.data);
    print(datos);

    setState(() {
      lista_expedientes = List<Expediente>.from(datos.map((x) => Expediente.fromJson(x)));
    });

    print(lista_expedientes.asMap());*/

  }

}