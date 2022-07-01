import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phisio_t/useless/registro2_screen.dart';
import 'package:phisio_t/screens/registro_screen.dart';
import 'package:phisio_t/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/colores.dart';
import 'expediente_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String visible = "visible";
  Uri myUri = Uri.parse(
      "https://wa.me/+524761364798?text=Prueba%20envio%20de%20mensaje%20de%20la%20app%20a%20Whatsapp");

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
          title: const Text(
            'Rehabilit - Fisioterapia Integral y Deporte',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        drawer: DrawerWidget(height),
        body: ListView(
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
                              fontSize: 25, fontWeight: FontWeight.w800))),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.08),
                    child: inputField('', 250),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: height * 0.085),
                      child: IconButton(
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 350), () {
                            setState(() {
                              //Cuando se le da en el icono de buscar, se hace visible la lista maquetada

                              visible = 'visible';
                            });
                          });
                        },
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.blue,
                        ),
                        iconSize: 50,
                      ))
                ],
              ),
              Visibility(
                visible: visible == 'visible' ? true : false,
                child: SizedBox(
                  height: height * 0.6,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 50),
                          child: infoPaciente(
                              width,
                              height,
                              'Alan Jesus Lopez Jacinto',
                              21,
                              "4761072633",
                              "Morelos #117, Purisima del Rincón")),
                      infoPaciente(width, height, 'Mario Valadez Quiroz', 21,
                          "476104545", "Cañada de Negros"),
                      infoPaciente(width, height, 'Gerson Luis Lopez Jacinto',
                          26, "4761072633", "San Miguel, León"),
                      infoPaciente(width, height, 'Maria Elena Jacinto Mendez',
                          21, "4761072232", "Dolores"),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ));
  }

  Widget inputField(String label, double largo) {
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

  Widget infoPaciente(double width, double height, String nombre, int edad,
      String telefono, String ubicacion) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ExpedienteScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(top: height * 0.08, right: 50),
        height: height * 0.5,
        width: 570,
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.01),
          border: Border.all(color: Colors.blue, width: 4),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(top: 30, left: 30),
            child: Text(nombre,
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text('Edad: ${edad} años',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
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
                  onPressed: () {},
                  // onPressed: () =>_launchInBrowser(myUri)
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 5, right: 15),
                child: Text('${telefono}',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 5, right: 15),
                child: Text('${ubicacion}',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boton('Expediente', Colors.green, 60, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExpedienteScreen()));
              }),
            ],
          ),
        ]),
      ),
    );
  }

  Widget boton(String label, Color color, double ancho, Function() funcion) {
    return Container(
        margin: EdgeInsets.only(top: 50),
        height: 50,
        width: 150,
        child: ElevatedButton(
          child: Text(
            label,
            style: const TextStyle(fontSize: 20),
          ),
          onPressed: funcion,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
          ),
        ));
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

//Future<void> _launchInBrowser(Uri url) async {
  //  if (!await launchUrl(
    //  url,
      //mode: LaunchMode.externalApplication,
    //)) {
      //throw 'Could not launch $url';
    //}
  //}