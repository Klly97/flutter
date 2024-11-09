import 'package:flutter/material.dart';//libreria de diseño

void main() {
  runApp(MyApp());//runApp corre las configuraciones iniciales de la aplicacion
}


class MyApp extends StatelessWidget{//StatelessWidget es un widget sin estado, son estaticos en la interfaz
@override
Widget build(BuildContext context){//Metodo build
return MaterialApp(//regresa un widget
home: Text("Hola Mundo"),
);//MaterialApp

}


}

  
