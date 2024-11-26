import 'package:flutter/material.dart';

const Color _colorPersonalizado =
    Color(0xFF49149f); //Colores personalizados en hexadecimal

const List<Color> _colorTemas = [
  //Arreglo para establecer una serie de colores para la aplicación
  _colorPersonalizado, //Posicion 0
  Colors.blue, //Posicion 1
  Colors.teal, //Posicion 2
  Colors.green, //Posicion 3
  Colors.yellow, //Posicion 4
  Colors.orange, //Posicion 5
  Colors.pink, //Posicion 6
];

class AppTema {//Nombre de la clase que va a exportar

  final int colorSeleccionado;
  AppTema({required this.colorSeleccionado})
      : assert(colorSeleccionado >= 0 && colorSeleccionado < _colorTemas.length,
            'Índice fuera de rango');

  ThemeData theme() {
    //Metodo que va a regresar algo de tiempo ThemeData, que sera lo que reciba el Theme en el main
    return ThemeData(
      useMaterial3: true, //Utilizar colores por defecto de material 3
      colorSchemeSeed: _colorTemas[
          3], //si se coloca una posicion mayor a 6 se desbordaria el arreglo
      //brightness: Brightness.dart//si se quiere poner el tema en modo oscuro
    );
  }
}
