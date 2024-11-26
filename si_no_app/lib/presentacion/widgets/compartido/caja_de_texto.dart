import 'package:flutter/material.dart';

class CajadeTexto extends StatelessWidget {

  final ValueChanged<String> onValue;
  const CajadeTexto({
    super.key, 
    required this.onValue
    });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    //final colors = Theme.of(context).colorSheme;

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40)
        );

    final inputDecoration = InputDecoration(
      hintText:'Finaliza su mensaje con un "?"', //Si finaliza con ? dispara el proceso de la respuesta automatica
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(//Boton e icono de enviar el mensaje
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          //ignore: avoid_print
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        //ignore: avoid_print
        
        textController.clear();//Limpia la caja despues de enviar el mensaje
        focusNode.requestFocus();
        onValue(value);
      },
      onChanged: (value) {
        //ignore: avoid_print
        print('Cambiado: $value');
      },
    );
  }
}
