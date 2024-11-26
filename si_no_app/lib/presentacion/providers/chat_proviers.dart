import 'package:flutter/material.dart';
import 'package:si_no_app/dominio/entidades/mensajes.dart';

class ChatProviers extends ChangeNotifier{//Para notificar cuando hay cambios

List<Mensaje> mensajeLista = [
Mensaje(text: 'Hola Mundo', deQuien: DeQuien.mio),
Mensaje(text: 'Donde estas ?', deQuien: DeQuien.mio),
Mensaje(text: 'En la casa ?', deQuien: DeQuien.ella),
];

Future<void> sendMenssage (String text) async{

  final newMensaje = Mensaje(text: text, deQuien: DeQuien.mio);
  mensajeLista.add(newMensaje);

  notifyListeners();
}

}