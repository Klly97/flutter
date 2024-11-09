import 'package:flutter/material.dart';

class CajadeTexto extends StatelessWidget{
  const CajadeTexto({super.key});

  @override
  Widget build(BuildContext context) {

    //final colors = Theme.of(contexto).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled:true,
      suffixIcon: IconButton(//Boton e icono de enviar el mensaje
        icon: const Icon(Icons.send_outlined),
        onPressed: (){
          
          //ignore: avoid_print
          print('Valor de la caja de texto?');
        },
        ),
    );
  
  return TextFormField(
    decoration: inputDecoration,
    onFieldSubmitted: (value){
      //ignore: avoid_print
      print('Enviar valor $value');
    },
    onChanged: (value){
      //ignore: avoid_print
      print('Cambiado');
    },
  );
  }
}