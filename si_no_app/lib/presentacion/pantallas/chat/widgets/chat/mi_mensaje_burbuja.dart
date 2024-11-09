import 'package:flutter/material.dart';
class MiMensajeBurbuja extends StatelessWidget {
  const MiMensajeBurbuja({super.key});
  @override
  Widget build(BuildContext context) {
   final colors = Theme.of(context).colorScheme;//Toma los colores para las burbujas del tema
   return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        decoration: BoxDecoration(
          color: colors.primary,//Toma el color definido en el tema, el 1, 2, 3, etc
          borderRadius: BorderRadius.circular(20)//Borde redondo en los chats
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Mensaje de Chat', style: TextStyle(color: Colors.white),),
          ),
      ),
      const SizedBox(height: 10)
    ],
   );
  }
}