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
  final TextEditingController txtEnfermedad = TextEditingController();


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
                        child: inputField('Nombre Completo', 350, txtNombre)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Telefono', 350, txtTelefono)
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, right: 30),
                              child: inputField('Edad', 75, txtEdad)
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15, left: 10),
                                child: inputField('Fecha de nacimiento', 230, txtFechaN)
                              ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Dirección', 350, txtDireccion)
                        ),
                         Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Ocupación', 350, txtOcupacion)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Enfermedad cronica', 350, txtEnfermedad)
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
                              child: boton('Cancelar', Colors.red, height, (){}))
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

//En esta parte se crean las funciones y los metodos dentro del contexto de la clase

  var _currentTab = TabItem.Expediente;

  final _navigatorKeys = {
    TabItem.Expediente: GlobalKey<NavigatorState>(),
    TabItem.Agenda: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  _selectFirstDate(context) async {
    DateTime? _selectedDate = null;
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime.utc(1950),
        lastDate: DateTime.now(),
        helpText: 'Selecciona una fecha',
        cancelText: 'Cancelar');

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      setState(() {
        var fecha_publicacion = DateFormat("yyyy-MM-dd").format(_selectedDate!);
        txtFechaN.text = fecha_publicacion;
      });
    }
  }

//Componentes personalizados por nosotros que reciben parametros dinamicos

  Widget inputField(String label, double largo, TextEditingController controller) {
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
            controller: controller,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 10)
            ),
          ),
        ),
      ],
    );
  }

  Widget inputDate(TextEditingController ctrl, String tipo,
      BuildContext context, String hint) {
    final inputBorder = OutlineInputBorder(
        borderSide: BorderSide(width: .1, color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(4)));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(left: 10),
            child: Text('Fecha de nacimiento',
                style: TextStyle(fontWeight: FontWeight.w600))),
        Container(
          height: 35,
          width: 250,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          child: TextField(
            onTap: () {
              if (tipo == 'date') {
                _selectFirstDate(context);
              }
            },
            focusNode: tipo == 'date' || tipo == 'date2'
                ? AlwaysDisabledFocusNode()
                : null,
            controller: ctrl,
            autocorrect: false,
            keyboardType:
                tipo == 'numero' ? TextInputType.number : TextInputType.text,
            enableSuggestions: false,
            cursorColor: Colors.blue,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat'),
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.only(top: 15),
              border: inputBorder,
              focusedBorder: inputBorder,
              enabledBorder: inputBorder,
            ),
          ),
        )
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
                });
              },
            )
          ]),
        ),
        Container(
          width: 350 / 4,
          child: Column(children: [
            Text('E. Pulmonarr', style: TextStyle(fontWeight: FontWeight.w600)),
            Checkbox(
              fillColor: MaterialStateProperty.all(Colors.blue),
              value: isCheckedP,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedP = value!;
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

  void getHttp() async {
  try {
    var response = await Dio().get('http://www.google.com');
    print(response);
  } catch (e) {
    print(e);
  }
}

  Future register() async {

    final data = {
      "nombre": txtNombre.text,
      "telefono": txtTelefono.text,
      "edad": txtEdad.text,
      "fecha_nacimiento": txtFechaN.text,
      "ocupacion": txtOcupacion.text,
      "direccion": txtDireccion.text,
    };

    print(data.entries);

    var response = await Dio().get("https://www.phisio-t.com/registro_paciente.php", queryParameters: data);

    print('${response.data}');


Future.delayed(const Duration(seconds: 1), () {
  //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),),);
   Fluttertoast.showToast(
          msg: "Se ha registrado el paciente con exito"
      );
   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
});
    //var data = json.decode(response.body);
    //if (data == "Success") {
      //correo.clear();
      //contrasena.clear();
     
    //} else {
      //Fluttertoast.showToast(
        //  msg: "Registro incorrecto"
      //);

    //}
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

/*Se crean los Items de la barra de navegacion inferior*/

enum TabItem { Expediente, Agenda }

const Map<TabItem, String> tabName = {
  TabItem.Expediente: 'Expediente',
  TabItem.Agenda: 'Agenda',
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.Expediente: Colors.lightBlue,
  TabItem.Agenda: Colors.lightBlue,
};


