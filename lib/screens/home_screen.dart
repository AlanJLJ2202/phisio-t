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
  Uri myUri = Uri.parse("https://wa.me/+524761364798?text=Prueba%20envio%20de%20mensaje%20de%20la%20app%20a%20Whatsapp");

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
                          Future.delayed(const Duration(milliseconds: 350), () {
                            setState(() {
                              //Cuando se le da en el icono de buscar, se hace visible la lista maquetada

                              visible = 'visible';
                            });
                          });
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
                visible: visible == 'visible' ? true : false,
                child: SizedBox(
                  height: 430,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 50),
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
                        onPressed: () {},
                        // onPressed: () =>_launchInBrowser(myUri)
                      ),
                    ),

                  ],
                ),
                Column(
                  children: [
                    infoPaciente(width, height, 'Alan Eduardo Cabrera Alcala', 20, '435345553', 'Purisima del Rincon')
                  ],
                ),
                Column(
                  children: [
                    infoPaciente(width, height, 'Alan Eduardo Cabrera Alcala', 20, '435345553', 'Purisima del Rincon')
                  ],
                ),
                Column(
                  children: [
                    infoPaciente(width, height, 'Alan Eduardo Cabrera Alcala', 20, '435345553', 'Purisima del Rincon')
                  ],
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
          child: const TextField(
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

  Widget infoPaciente(double width, double height, String nombre, int edad,
      String telefono, String ubicacion) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ExpedienteScreen()));
      },
      child: Container(
        margin: width < 450 ? EdgeInsets.only(top: height * 0.06) : EdgeInsets.only(top: height * 0.08, right: 40),
        height: width > 450 ? 470 : 370,
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
            child: Text(nombre,
                style: TextStyle(
                    fontSize: width > 450 ? 32 : 32,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Text('Edad: ${edad} años',
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
                child: Text('${telefono}',
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
                child: Text('${ubicacion}',
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
                      MaterialPageRoute(builder: (context) => ExpedienteScreen()));
                }, width),
              ),
              Container(
                margin: width > 450 ? const EdgeInsets.only(top: 40) : const EdgeInsets.only(top: 20),
                child: boton('Historial', Colors.grey, 60, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExpedienteScreen()));
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