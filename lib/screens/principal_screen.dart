import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phisio_t/widgets/formulario_web.dart';
import 'package:intl/intl.dart';




class PrincipalScreen extends StatefulWidget {
  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}


enum TabItem { Expediente, Agenda}

const Map<TabItem, String> tabName = {
  TabItem.Expediente: 'Expediente',
  TabItem.Agenda: 'Agenda',
 
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.Expediente: Colors.lightBlue,
  TabItem.Agenda: Colors.lightBlue,
};

class _PrincipalScreenState extends State<PrincipalScreen> {
  
  final TextEditingController txtFecha = TextEditingController();

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
  
  @override
  Widget build(BuildContext context) {
  
    double width = MediaQuery. of(context).size.width ;
    double height = MediaQuery. of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        backgroundColor: Colors.blueAccent,
        title: const Text('Fisioterapeuta'),
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
              margin: EdgeInsets.only(top: 30, bottom: 5, right: 20),
              child: const Text('Nuevo Paciente', 
              style: TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.w100,
                color: Colors.blue),
                )
              ),
            Container(
              height: height*0.75,
              width: 450,

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
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: const Text('Apellidos', style: TextStyle(fontWeight: FontWeight.w600))),
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
              style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: 'Montserrat'),
              decoration: InputDecoration(
                hintText: hint,
                contentPadding: EdgeInsets.only(
                    bottom: 10,
                    top: 10,
                    left: 20,
                    right: 20
                ),
                isDense: true,
                border: inputBorder,
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
              ),
            ),
          )
        ],
    );
  }

   _selectFirstDate(context) async{
    DateTime? _selectedDate = null;
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365 * 3)),
        helpText: 'Selecciona una fecha',
        cancelText: 'Cancelar'
    );

    if(newSelectedDate != null){
      _selectedDate = newSelectedDate;
      setState(() {
        var fecha_publicacion = DateFormat("yyyy-MM-dd").format(_selectedDate!);
        //txtInicioPub.text = fecha_publicacion;
      });
    }
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


