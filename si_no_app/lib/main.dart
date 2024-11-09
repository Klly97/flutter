import 'package:flutter/material.dart';
import 'package:si_no_app/config/tema/app_tema.dart';
import 'package:si_no_app/presentacion/pantallas/chat/chat_pantalla.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  //Este widget es la raiz de su aplicación.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: AppTema(colorSeleccionado: 2).theme(),//obtener el tema
      home: const ChatPantalla(

      )
      );
  }
}