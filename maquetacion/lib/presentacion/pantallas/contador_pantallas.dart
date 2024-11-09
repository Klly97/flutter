import 'package:flutter/material.dart';
//Acceso directo stles y tabulador

class Contador extends StatefulWidget {//Widget con estado
  const Contador ({super.key});

  @override
  State<Contador> createState() => _ContadorState();//Crreacion del estado
}

class _ContadorState extends State<Contador>{//Extiende d ela clase state

int clickCounter = 0;//Contador de clicks

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: const Text('contador de Pantalla'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Definir el tamaño de la letra
          Text('$clickCounter',
            style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
          Text("Clicks${clickCounter == 1 ? '':'s'}",//Condicion, si clickCounter es =1 dejea un espacio
          style: const TextStyle(fontSize: 25))
        ],
      ),
    ),
  floatingActionButton:FloatingActionButton(
    onPressed:(){//Cuando se presione el boton
    setState(() {//Actualiza la pantalla poara que se vean los cambios


      clickCounter = clickCounter + 1; //Incrementa en 1
      //clickCounter++;
    });

    },
    child: const Icon(Icons.plus_one),
    ),
  );
}

}