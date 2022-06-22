import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phisio_t/widgets/formulario_web.dart';
import 'package:intl/intl.dart';




class PrincipalScreen extends StatefulWidget {
  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}


class _PrincipalScreenState extends State<PrincipalScreen> {
  
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
        title: const Text('Nuevo Paciente'),
      ),
      drawer: Drawer(
        elevation: 30,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height*0.1),
              child: const Text('Rehabilit', 
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100)
              )
              ),
            Container(
              margin: EdgeInsets.only(top: height*0.7),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color> (Colors.blue)),
                onPressed: (){
                  
                }, 
                child: const Text('Cerrar sesión')
                ),
            )
        ]
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: height*0.8,
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
                    )]
                ),


                //Esto es lo que lleva dentro el contenedor primario

                child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: inputField('Nombre(s)', 350)
                        ),
                        /*Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text('Apellidos', style: TextStyle(fontWeight: FontWeight.w600))),*/
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: inputField('Paterno', 150)),
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: inputField('Materno', 150))
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Telefono', 350)
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, right: 10),
                              child: inputField('Edad', 75)
                              ),
                              Container(
                              margin: EdgeInsets.only(top: 15, left: 10),
                              child: inputDate(txtFecha, 'date', context, txtFecha.text)
                              ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Dirección', 350)
                        ),
                         Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Ocupación', 350)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: inputField('Enfermedad cronica', 350)
                          ),
                        checkRow(width),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: boton('Guardar', Colors.green, height)),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: boton('Cancelar', Colors.red, height))
                          ],
                     ),
                  ]
                  ),
                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab, 
        onSelectTab: _selectTab
        )
    );

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
            child: Text(label, style: TextStyle(fontWeight: FontWeight.w600))
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
              width: 250,
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
    margin: EdgeInsets.only(top: 15),
    height: 38,
    width: 100,
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


class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.Expediente, Icons.analytics_outlined),
        _buildItem(TabItem.Agenda, Icons.calendar_month_outlined),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: activeTabColor[currentTab]!,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, IconData icono) {
    return BottomNavigationBarItem(
      icon: Icon(
        icono,
        color: _colorTabMatching(tabItem),
      ),
      label: tabName[tabItem],
    );
  }

  Color _colorTabMatching(TabItem item) {
    return currentTab == item ? activeTabColor[item]! : Colors.grey;
  }
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

