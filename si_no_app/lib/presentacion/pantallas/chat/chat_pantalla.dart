import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_no_app/dominio/entidades/mensajes.dart';
import 'package:si_no_app/presentacion/providers/chat_proviers.dart';
import 'package:si_no_app/presentacion/widgets/chat/mi_mensaje_burbuja.dart';
import 'package:si_no_app/presentacion/widgets/chat/su_mensaje_burbuja.dart';
import 'package:si_no_app/presentacion/widgets/compartido/caja_de_texto.dart';

class ChatPantalla extends StatelessWidget {
  const ChatPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          //El leading es un espacio que se tiene antes del titulo
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: //Escoger la url de cualquier imagen en internet
                NetworkImage(
                    'https://encrypted-tbn1.gstatic.com/inages?q=tbn:ANd9GcSbxmzvX60XzJGdFfc_Oip_djcpzUkJ7GKQBc35uUfh-bYxjb'),
          ), //Avatar circular
        ),
        title: const Text('Emilia'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProviders = context.watch()<ChatProviers>();

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        //La columna sirve para colocar un widget debajo de otro
        children: [
          Expanded(
              //Expaded Permite expandir todo el widget hijo a todo el espacio disponible que el padre le de a la lista de elementos
              child: ListView.builder(
                  itemCount: chatProviders
                      .mensajeLista.length, //solo permite 100 elementos
                  itemBuilder: (context, index) {
                    final mensaje = chatProviders.mensajeLista[index];

                    return (mensaje.deQuien == DeQuien.ella)
                        ? const SuMensajeBurbuja()
                        : MiMensajeBurbuja(mensaje: mensaje);
                  })),

          //caja de Texto
          CajadeTexto(
            onValue: chatProviders.sendMessage,

          ),
        ],
      ),
    ));
  }
}
