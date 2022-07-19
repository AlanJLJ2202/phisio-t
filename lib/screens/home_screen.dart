import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phisio_t/screens/historial_screen.dart';
import 'package:phisio_t/useless/registro2_screen.dart';
import 'package:phisio_t/screens/registro_screen.dart';
import 'package:phisio_t/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/paciente.dart';
import '../utils/colores.dart';
import 'expediente_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String visible = "visible";
  Uri myUri = Uri.parse("https://wa.me/+524761364798?text=Prueba%20envio%20de%20mensaje%20de%20la%20app%20a%20Whatsapp");
  final TextEditingController txtBusqueda = TextEditingController();

  List<Paciente> lista_pacientes = [];


//Hm99618661
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
        body: width > 450 ? ListView(
          children: [
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: height * 0.08, left: width * 0.05),
                      child: const Text('Buscar Paciente: ',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900))),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.08),
                    child: inputField('', 350),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: height * 0.085),
                      child: IconButton(
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 350), () => _busqueda());
                        },
                        icon: const Icon(
                          Icons.person_search,
                          color: Colors.green,
                        ),
                        iconSize: 65,
                      ))
                ],
              ),
              Visibility(
                visible: lista_pacientes.length > 0 ? true : false,
                child: SizedBox(
                  height: 430,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: List.generate(lista_pacientes.length, (index) {
                          return infoPaciente(lista_pacientes[index], context, width, height);
                        }),
                      )

                    ],
                  ),
                ),
              ),
            ]),
          ],
        )
            :

        ListView(

          children: [
            Column(
              children: [
                /*Container(
                    child: const Text('Fisioterapia Integral y Deporte',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400, fontFamily: 'GreatVibes')
                    )),*/
                Container(
                    margin: EdgeInsets.only(
                        top: height * 0.08, left: width * 0.05),
                    child: const Text('Buscar Paciente',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: inputField('', 275),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: IconButton(
                        iconSize: 45,
                        icon: const Icon(
                          Icons.person_search,
                          color: Colors.green,

                        ),
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 350), () => _busqueda());
                        },
                        // onPressed: () =>_launchInBrowser(myUri)
                      ),
                    ),

                  ],
                ),
                Visibility(
                  visible: lista_pacientes.length > 0 ? true : false,
                  child: Column(
                    children: List.generate(lista_pacientes.length, (index) {
                      return infoPaciente(lista_pacientes[index], context, width, height);
                    }),
                  )
                ),
              ],
            ),
          ],
        ),

    );
  }

  Widget inputField(String label, double largo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 35,
          width: largo,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          child: TextField(
            controller: txtBusqueda,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 15)
            ),
          ),
        ),
      ],
    );
  }

  Widget infoPaciente(Paciente paciente, BuildContext context, double width, double height) {
    return GestureDetector(
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ExpedienteScreen(paciente)));
      },
      child: Container(
        margin: width < 450 ? EdgeInsets.only(top: height * 0.06) : EdgeInsets.only(top: height * 0.08, right: 40),
        height: width > 450 ? 470 : 350,
        width: width > 450 ? 570 : 350,
        decoration: BoxDecoration(
          //color: Colors.transparent,
          border: Border.all(color: Colors.blue, width: 4),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
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
              Colors.blue.shade300,
              Colors.blue,
            ],
          )
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(top: 30, left: 30),
            child: Text(paciente.nombre,
                style: TextStyle(
                    fontSize: width > 450 ? 32 : 32,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Text('Edad: ${paciente.edad} años',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: width > 450 ? const EdgeInsets.only(top: 20, left: 30) : const EdgeInsets.only(top: 15, left: 30),
                child: IconButton(
                  iconSize: 40,
                  icon: const Icon(
                    Icons.whatsapp_outlined,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                  // onPressed: () =>_launchInBrowser(myUri)
                ),
              ),
              Container(
                margin: width  > 450 ? const EdgeInsets.only(top: 30, left: 5, right: 15) : const EdgeInsets.only(top: 20, left: 5, right: 15),
                child: Text('${paciente.telefono}',
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: width > 450 ? const EdgeInsets.only(top: 20, left: 30) : const EdgeInsets.only(top: 15, left: 30),
                child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
              Container(
                margin: width  > 700 ? const EdgeInsets.only(top: 30, left: 5, right: 15) : const EdgeInsets.only(top: 20, left: 5, right: 15),
                child: Text('${paciente.direccion}',
                    style:
                        const TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: width > 450 ? const EdgeInsets.only(top: 40) : const EdgeInsets.only(top: 20),

                child: boton('Expediente', Colors.green, 60, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExpedienteScreen(paciente)));
                }, width),
              ),
              Container(
                margin: width > 450 ? const EdgeInsets.only(top: 40) : const EdgeInsets.only(top: 20),
                child: boton('Historial', Colors.deepOrangeAccent, 60, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistorialScreen(paciente)));
                }, width),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget boton(String label, Color color, double ancho, Function() funcion, double width) {
    return Container(
        height: 50,
        width: width > 450 ? 150 : 120,
        child: ElevatedButton(

          onPressed: funcion,

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            elevation: MaterialStateProperty.all(25)
          ),

          child: Text(
            label,
            style: width > 450 ? TextStyle(fontSize: 20) : TextStyle(fontSize: 15),
          ),
        ));
  }


  Future _busqueda() async {

    final data = {
      "busqueda": txtBusqueda.text,
    };

    print(data.entries);

    final response = await Dio().get("https://www.phisio-t.com/busqueda_paciente.php", queryParameters: data);

    var datos = jsonDecode(response.data);
    print(datos);

    setState(() {
      lista_pacientes = List<Paciente>.from(datos.map((x) => Paciente.fromJson(x)));
    });

    print(lista_pacientes.asMap());
    //print('PRINT DE PACIENTES = ' + lista_pacientes.asMap().toString());
  }

}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}




