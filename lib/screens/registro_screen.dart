import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:phisio_t/screens/home_screen.dart';
import '../widgets/drawer.dart';



class RegistroScreen extends StatefulWidget {
  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {

  bool isCheckedH = false;
  bool isCheckedD = false;
  bool isCheckedA = false;
  bool isCheckedP = false;

  final TextEditingController txtNombre = TextEditingController();
  final TextEditingController txtTelefono = TextEditingController();
  final TextEditingController txtEdad = TextEditingController();
  final TextEditingController txtFechaN = TextEditingController();
  final TextEditingController txtOcupacion = TextEditingController();
  final TextEditingController txtDireccion = TextEditingController();
  final TextEditingController txtEnfermedadC = TextEditingController();


  String hipertension = 'Sin Hipertensión';
  String diabetes = 'Sin Diabetes';
  String Artritis = 'Sin Art/Ost';
  String enf_pulmonar = 'Sin Enfermedad Pulmonar';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text('Nuevo Paciente - ID: ${height.round()}, ${width.round()}', style: TextStyle(fontWeight: FontWeight.w800),),
      ),
      drawer: DrawerWidget(height),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 570,
              width: 450,
              margin: EdgeInsets.only(top: height*0.02),


                //Solo decoracion, donde se le da color de fondo, sombra y tamaño

                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 4),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
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

                //Esto es lo que lleva dentro el contenedor primario

                child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: inputField('Nombre Completo', 350, txtNombre, 100, '')
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Telefono', 350, txtTelefono, 10, '')
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, right: 30),
                              child: inputField('Edad', 75, txtEdad, 2, '')
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15, left: 10),
                                child: inputField('Fecha de nacimiento', 230, txtFechaN, 10, 'año-dia-mes')
                              ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Dirección', 350, txtDireccion, 100, '')
                        ),
                         Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Ocupación', 350, txtOcupacion, 100, '')
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Enfermedad cronica', 350, txtEnfermedadC, 100, '')
                          ),
                        checkRow(width),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: boton('Guardar', Colors.green, height, () => register())),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: boton('Cancelar', Colors.red, height, () {

                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                              }))
                          ],
                     ),
                  ]
                  ),
              )
            ],
          ),
        ),
    );  //bottomNavigationBar: BottomNavigation(currentTab: _currentTab, onSelectTab: _selectTab));
  }


//Componentes personalizados por nosotros que reciben parametros dinamicos

  Widget inputField(String label, double largo, TextEditingController controller, int maxLenght, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(label, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.blue))),
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
          child: TextField(

            maxLength: maxLenght,
            controller: controller,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),
            decoration: InputDecoration(
              counterText: '',
              hintText: hint,
              contentPadding: const EdgeInsets.only(bottom: 10)
            ),
          ),
        ),
      ],
    );
  }


  Widget checkRow(double width) {
    return Container(
      height: 48,
      width: width,
      margin: EdgeInsets.only(top: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 350 / 4,
          child: Column(children: [
            Text('Hipertensión', style: TextStyle(fontWeight: FontWeight.w600)),
            Checkbox(
              value: isCheckedH,
              fillColor: MaterialStateProperty.all(Colors.blue),
              onChanged: (bool? value) {
                setState(() {
                  isCheckedH = value!;
                  hipertension = 'Cuenta con Hipertensión';
                });
              },
            )
          ]),
        ),
        Container(
          width: 350 / 4,
          child: Column(children: [
            Text('Diabetes', style: TextStyle(fontWeight: FontWeight.w600)),
            Checkbox(
              value: isCheckedD,
              fillColor: MaterialStateProperty.all(Colors.blue),
              onChanged: (bool? value) {
                setState(() {
                  isCheckedD = value!;
                  diabetes = 'Cuenta con Diabetes';
                });
              },
            )
          ]),
        ),
        Container(
          width: 350 / 4,
          child: Column(children: [
            Text('Art/Ost', style: TextStyle(fontWeight: FontWeight.w600)),
            Checkbox(
              fillColor: MaterialStateProperty.all(Colors.blue),
              value: isCheckedA,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedA = value!;
                  Artritis = 'Cuenta con Art/Ost';
                });
              },
            )
          ]),
        ),
        Container(
          width: 350 / 4,
          child: Column(children: [
            Text('E. Pulmonar', style: TextStyle(fontWeight: FontWeight.w600)),
            Checkbox(
              fillColor: MaterialStateProperty.all(Colors.blue),
              value: isCheckedP,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedP = value!;
                  enf_pulmonar = 'Cuenta con Enfermedad pulmonar';
                });
              },
            )
          ]),
        ),
      ]),
    );
  }

  Widget boton(String label, Color color, double ancho, Function() funcion) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        height: 38,
        width: 100,
        child: ElevatedButton(
          child: Text('${label}'),
          onPressed: funcion,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
          ),
        ));
  }


  Future register() async {

    String otras_enfermedades = '${hipertension}, ${diabetes}, ${Artritis}, ${enf_pulmonar}';


    if(txtNombre.text.isEmpty
        || txtTelefono.text.isEmpty
        || txtEdad.text.isEmpty
        || txtFechaN.text.isEmpty
        || txtDireccion.text.isEmpty){

      Fluttertoast.showToast(
          msg: "Falta informacion por capturar",
          backgroundColor: Colors.red,
          webBgColor: 'linear-gradient(to right, #EF2D13, #EF2D13)'
      );

    }else{


      print('enfermedades');
      print(otras_enfermedades);

      final data = {
        "nombre": txtNombre.text,
        "telefono": txtTelefono.text,
        "edad": txtEdad.text,
        "fecha_nacimiento": txtFechaN.text,
        "ocupacion": txtOcupacion.text,
        "direccion": txtDireccion.text,
        "enfermedad_cronica": txtEnfermedadC.text,
        "otra_enfermedad": otras_enfermedades
      };

      var response = await Dio().get("https://www.phisio-t.com/registro_paciente.php", queryParameters: data);

      print('${response.data}');


      Future.delayed(const Duration(seconds: 1), () {

        Fluttertoast.showToast(
            msg: "Se ha registrado el paciente con exito"
        );

        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

      });


    }




  }
}




