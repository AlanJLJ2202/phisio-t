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
  final TextEditingController fechaCtrl = TextEditingController();

  _FormularioWebState(this.width, this.height);

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: height*0.1, left: width*0.65, right: width*0.1),
          child: campoTexto('Fecha', width*0.25, TextInputType.datetime, fechaCtrl, 10)
          ),
        Container(
          margin: EdgeInsets.only(top: height*0.05, left: width*0.4, right: width*0.1),
          child: Row(
            children: [
              campoTexto('Nombre', width*0.5, TextInputType.datetime, fechaCtrl, 10),
              campoTexto('Telefono', width*0.30, TextInputType.datetime, fechaCtrl, 10)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: height*0.02, left: width*0.1, right: width*0.1),
            child: Row(
            children: [
              campoTexto('Edad', width*0.15, TextInputType.datetime, fechaCtrl, 10),
              campoTexto('Fecha de N', width*0.30, TextInputType.datetime, fechaCtrl, 10),
              campoTexto('Ocupacion', width*0.35, TextInputType.datetime, fechaCtrl, 10)
            ],
          ),
          ),
          Container(
          margin: EdgeInsets.only(top: height*0.02, left: width*0.1, right: width*0.1),
            child: Row(
            children: [
              campoTexto('Direccion', width*0.35, TextInputType.datetime, fechaCtrl, 10),
              campoTexto('Enf. Cronica', width*0.45, TextInputType.datetime, fechaCtrl, 10),
            ],
          ),
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
                //border: InputBorder.none,
                contentPadding: EdgeInsets.only(top:14),
                counterText: '',
                //hintText: 'Email',
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

}