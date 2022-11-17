import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        //Aqui puede ir la imagen
        child: Center(
          child: Container(
            width: 350,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow:[
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
                //you can set more BoxShadow() here
              ],
            ),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 60, bottom: 10),
                    child: const Text('Rehabilit',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.blue)
                    )
                ),
                Container(
                  child: Text(
                    'Fisioterapia Integral y Deporte',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                inputField('Ingresa tu usuario', false, 70),
                inputField('Ingresa la contraseña', true, 30),
                Container(
                  height: 40,
                  width: 150,
                  margin: EdgeInsets.only(top: 70),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Iniciar sesión'
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget inputField(String label, bool isPass, double margin_top){
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: margin_top),
      height: 45,
      child: TextField(
          textAlign: TextAlign.center,
          obscureText: isPass,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            labelText: '${label}',
          )
      ),
    );
  }

}