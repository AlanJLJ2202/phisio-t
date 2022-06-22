import 'package:flutter/material.dart';

class FormularioWeb extends StatefulWidget{

final double height;
final double width;

  FormularioWeb(this.height, this.width);

  @override
  State<FormularioWeb> createState() => _FormularioWebState(height, width);
}

class _FormularioWebState extends State<FormularioWeb> {
  
  final double width;
  final double height;
  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController apellidoPCtrl = TextEditingController();
  final TextEditingController apellidoMCtrl = TextEditingController();
  final TextEditingController telefonoCtrl = TextEditingController();
  final TextEditingController edadCtrl = TextEditingController();
  final TextEditingController fechaNCtrl = TextEditingController();
  final TextEditingController ocupacionCtrl = TextEditingController();
  final TextEditingController direccionCtrl = TextEditingController();
  final TextEditingController enfCronicaCtrl = TextEditingController();



  _FormularioWebState(this.width, this.height);

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //TITULO
        Container(
          margin: EdgeInsets.only(top: 30),
          child: 
          const Text('Nuevo paciente', style: TextStyle(fontSize: 35)
          ),
        ),

        //FORMULARIO
        Container(
          margin: EdgeInsets.only(top: height*0.05, left: width*0.5, right: width*0.1),
          child: Row(
            children: [
              campoTexto('Nombre', width*0.3, TextInputType.name, nombreCtrl, 25),
              campoTexto('Apellido P', width*0.3, TextInputType.name, apellidoPCtrl, 25),
              campoTexto('Apellido M', width*0.3, TextInputType.name, apellidoMCtrl, 25),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: height*0.02, left: width*0.45, right: width*0.1),
            child: Row(
            children: [
              campoTexto('Telefono', width*0.2, TextInputType.number, telefonoCtrl, 10),
              campoTexto('Edad', width*0.15, TextInputType.datetime, edadCtrl, 2),
              campoTexto('Fecha de N', width*0.30, TextInputType.datetime, fechaNCtrl, 10),
              campoTexto('Ocupacion', width*0.35, TextInputType.datetime, ocupacionCtrl, 20)
            ],
          ),
          ),
          Container(
          margin: EdgeInsets.only(top: height*0.02, left: width*0.45, right: width*0.1),
            child: Row(
            children: [
              campoTexto('Direccion', width*0.35, TextInputType.datetime, direccionCtrl, 35),
              campoTexto('Enf. Cronica', width*0.45, TextInputType.datetime, enfCronicaCtrl, 50),
            ],
          ),
          ),

          //BOTON
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: boton('Guardar', Colors.blue)),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: boton('Cancelar', Colors.red))
            ],
          )
      ],
    );
  }

Widget campoTexto(String label, double largo, TextInputType input, TextEditingController ctrl, int maxLength){
    return Container(
          //color: Colors.grey,
          width: largo,
          height: 50,
          child: Row(
            children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('${label}: '),
            ),
            Expanded(
              child: Container(
              child: TextField(
            keyboardType: input,
            maxLength: maxLength,
            controller: ctrl,
            style: const TextStyle(
                color: Colors.black87
            ),
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top:14),
                counterText: '',
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
               )
                ),
            )
          ]),
        );
  }


Widget boton(String label, Color color){
  return Container(
    margin: EdgeInsets.only(top: 50),
    height: 50,
    width: 150,
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