
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phisio_t/screens/registro_screen.dart';

import '../widgets/drawer.dart';
import '../widgets/navigationbar_widget.dart';
import '../screens/home_screen.dart';




class Registro2Screen extends StatefulWidget {
  @override
  State<Registro2Screen> createState() => _Registro2ScreenState();
}


class _Registro2ScreenState extends State<Registro2Screen> {
  
  bool isCheckedH = false;
  bool isCheckedD = false;
  bool isCheckedA = false;
  bool isCheckedP = false;

  final TextEditingController txtFecha = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
  
    double width = MediaQuery. of(context).size.width ;
    double height = MediaQuery. of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text('Nuevo Paciente', style: TextStyle(fontWeight: FontWeight.w800),),
      ),
      drawer: DrawerWidget(height),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height*0.55,
              width: 650,
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
                    )]
                ),


                //Esto es lo que lleva dentro el contenedor primario

                child: Column(
                    children: [
                     
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Container(
                                 margin: const EdgeInsets.only(top: 10),
                                  child: inputField('Nombre(s)', 350)),
                                Container(
                                margin: const EdgeInsets.only(left: 20, top: 10),
                                child: inputField('Telefono', 150)),
                                /*Container(
                                margin: const EdgeInsets.only(left: 20, top: 10),
                                child: inputField('Materno', 120))*/
                          ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Container(
                              margin: EdgeInsets.only(top: 30, right: 10, left: 5),
                              child: inputField('Edad', 75)
                              ),
                              Container(
                              margin: EdgeInsets.only(top: 30, right: 15),
                              child: inputDate(txtFecha, 'date', context, txtFecha.text)
                              ),
                              Container(
                              margin: EdgeInsets.only(top: 30, right: 10, left: 10),
                              child: inputField('Ocupación', 260)
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: inputField('Dirección', 300)
                            ),
                            Container(
                          margin: EdgeInsets.only(top: 30, left: 15),
                          child: inputField('Enfermedad cronica', 200)
                          ),
                          ],
                        ),
                        
                        checkRow(width),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              child: boton('Guardar', Colors.green, height)),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child: boton('Cancelar', Colors.red, height))
                          ],
                     ),
                  ]
                  ),
                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Principal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.personal_injury_outlined),
            label: 'Nuevo Paciente',
          ),
      ]
      )
    );

  }

//En esta parte se crean las funciones y los metodos dentro del contexto de la clase

    var _currentTabb = TabItem.Expediente;

    final _navigatorKeys = {
    TabItem.Expediente: GlobalKey<NavigatorState>(),
    TabItem.Agenda: GlobalKey<NavigatorState>(),
    };

    void _selectTab(TabItem tabItem) {
      if (tabItem == _currentTabb) {
      // pop to first route
       _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
      } else {
      setState(() => _currentTabb = tabItem);
      }
    }

    _selectFirstDate(context) async{
    DateTime? _selectedDate = null;
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime.utc(1950),
      lastDate: DateTime.now(),
        helpText: 'Selecciona una fecha',
        cancelText: 'Cancelar'
    );

    if(newSelectedDate != null){
      _selectedDate = newSelectedDate;
      setState(() {
        var fecha_publicacion = DateFormat("yyyy-MM-dd").format(_selectedDate!);
        txtFecha.text = fecha_publicacion;
      });
    }
  }

//Componentes personalizados por nosotros que reciben parametros dinamicos

  Widget inputField(String label, double largo){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(label, style: TextStyle(fontWeight: FontWeight.w900))
            ),
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

  Widget inputDate(TextEditingController ctrl, String tipo, BuildContext context, String hint){

    final inputBorder = OutlineInputBorder(
        borderSide: BorderSide(width: .1, color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(4))
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text('Fecha de nacimiento', style: TextStyle(fontWeight: FontWeight.w600))
            ),
            Container(
              height: 35,
              width: 150,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1),
              borderRadius: const BorderRadius.all(
                    Radius.circular(14),
                  ),
              ),
              child: TextField(
              onTap: (){
                if(tipo == 'date'){
                  _selectFirstDate(context);
                }
              },
              focusNode: tipo=='date' || tipo=='date2' ? AlwaysDisabledFocusNode() : null,
              controller: ctrl,
              autocorrect: false,
              keyboardType: tipo == 'numero' ? TextInputType.number : TextInputType.text,
              enableSuggestions: false,
              cursorColor: Colors.blue,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: 'Montserrat'),
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

  Widget checkRow(double width){
    return Container(
      height: 50,
      width: width,
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
          width: 350/4,
          child: Column(
            children: [
            Text('Hipertensión', style: TextStyle(fontWeight: FontWeight.w600)),
             Checkbox( 
              value: isCheckedH,
              fillColor: MaterialStateProperty.all(Colors.blue),
              onChanged: (bool? value) {
                setState(() {
                  isCheckedH = value!;
                });
              },)
          ]),
          ),
        Container(
          width: 350/4,
          child: Column(
            children: [
            Text('Diabetes', style: TextStyle(fontWeight: FontWeight.w600)),
             Checkbox( 
              value: isCheckedD,
              fillColor: MaterialStateProperty.all(Colors.blue),
              onChanged: (bool? value) {
                setState(() {
                  isCheckedD = value!;
                });
              },)
          ]),
          ),
        Container(
          width: 350/4,
          child: Column(
            children: [
            Text('Art/Ost', style: TextStyle(fontWeight: FontWeight.w600)),
             Checkbox( 
              fillColor: MaterialStateProperty.all(Colors.blue),
              value: isCheckedA,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedA = value!;
                });
              },)
          ]),
          ),
        Container(
          width: 350/4,
          child: Column(
            children: [
            Text('E. Pulmonar', style: TextStyle(fontWeight: FontWeight.w600)),
             Checkbox( 
              fillColor: MaterialStateProperty.all(Colors.blue),
              value: isCheckedP,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedP = value!;
                });
              },)
          ]), 
          ),    
      ]),
    );
  }

  Widget boton(String label, Color color, double ancho){
  return Container(
    margin: EdgeInsets.only(top: 10),
    height: 50,
    width: 125,
    child: ElevatedButton(
      child: 
      Text('${label}'),
      onPressed: (){},
      style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      )
    );
}

}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}                     



/*Se crean los Items de la barra de navegacion inferior*/

enum TabItem {Expediente, Agenda}

const Map<TabItem, String> tabName = {
  TabItem.Expediente: 'Expediente',
  TabItem.Agenda: 'Agenda',
 
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.Expediente: Colors.lightBlue,
  TabItem.Agenda: Colors.lightBlue,
};

 