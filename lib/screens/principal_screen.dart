import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
  
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;


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
      body: ListView(
        children: [
          formulario(height, width)
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab, 
        onSelectTab: _selectTab
        )
    );

  }


  Widget formulario(double height, double width){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: height*0.1, left: width*0.65, right: width*0.1),
          child: campoTexto('Fecha:', width*0.25)
          ),
        Container(
          margin: EdgeInsets.only(top: height*0.05, left: width*0.1, right: width*0.1),
          child: Row(
            children: [
              campoTexto('Nombre:', width*0.5),
              campoTexto('Telefono:', width*0.30)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: height*0.02, left: width*0.1, right: width*0.1),
            child: Row(
            children: [
              campoTexto('Edad:', width*0.15),
              campoTexto('Fecha de N:', width*0.30),
              campoTexto('Ocupacion:', width*0.35)
            ],
          ),
          ),
          Container(
          margin: EdgeInsets.only(top: height*0.02, left: width*0.1, right: width*0.1),
            child: Row(
            children: [
              campoTexto('Direccion:', width*0.35),
              campoTexto('Enf. Cronica:', width*0.45),
            ],
          ),
          )
      ],
    );
  }


  Widget campoTexto(String label, double largo){
    return Container(
          color: Colors.grey,
          width: largo,
          height: 50,
          child: Row(children: [
            Container(
              child: Text(label),
            ),
            Expanded(
              child: Container(color: Colors.amber),
            )
          ]),
        );
  }

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


