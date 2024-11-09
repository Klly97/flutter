import 'package:flutter/material.dart';
//import 'package:maquetacion/presentacion/pantallas/contador_pantallas.dart';
import 'package:maquetacion/presentacion/pantallas/contador_pantallas_funciones.dart'; //Libreria con diseños

void main() {
  runApp(const MainApp());//RunAppp corre las configuraciones iniciales de la aplicacion
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  //StatelessWidget es un Widget sin estado, son estaticos de la interfaz. ej:icino,texto.

  @override
  Widget build(BuildContext context) {//Metodo build
    return MaterialApp(//regresa un Widget
    //Ctrl espaciadora baner tap
    debugShowCheckedModeBanner: false, //Quita la marca de la esquina del emulador
    theme:ThemeData(//Tema de la Aplicacion
      useMaterial3: true,
      colorSchemeSeed: Colors.blue
    ),
    home: const ContadorPantallasFunciones()//Clase a la que llama del archivo contador_pantallas_funciones  
        );
  }
}
