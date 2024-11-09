import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';/*biblioteca para evaluar expresiones matematicas*/

void main() {
  runApp(const MainApp());/*inicia la app y establece MainApp como la aplicacion principal*/ 
}

class MainApp extends StatelessWidget {/*es un widget sin */
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {/*El método build es donde se describe la interfaz de usuario del widget. Se llama cada vez que Flutter necesita redibujar el widget. */
    return MaterialApp(
      title: 'calculadora',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: '',)
    );
  }
}

final txtEntrada = TextEditingController();/*Controladores*/
final txtResultado = TextEditingController();/*Controladores*/

class MyHomePage extends StatefulWidget {/*Es un widget con estado que representa la página principal de la calculadora. Acepta un título como parámetro. */
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {/*clase donde se realiza la calculadora*/
  @override
  Widget build(BuildContext context) {/*Aqui comienza contenedor del diseño de la calculadora*/
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 2, 2),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[/*hijo*/
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: const InputDecoration.collapsed(
                hintText: "0",/*operacion */
                hintStyle: TextStyle(
                  fontSize: 40,
                  fontFamily: 'RobotoMono',
                ),
              ),
              style: const TextStyle(
                fontSize: 40,
                fontFamily: 'RobotoMono',
              ),
              textAlign: TextAlign.right,
              controller: txtEntrada,
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: const InputDecoration.collapsed(
                hintText: "0",/*resultado */
                fillColor: Colors.deepPurpleAccent,
                hintStyle: TextStyle(fontFamily: 'RobotoMono'),
              ),
              textInputAction: TextInputAction.none,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 42,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 247, 244, 244),
              ),
              textAlign: TextAlign.right,
              controller: txtResultado,
              readOnly: true, // Para que no se pueda editar el resultado
            ),
          ),

          const SizedBox(height: 20.0),/*Metodo que agrupa en filas, y que genera un row con botones*/
          buildButtonRow(['AC', 'C', '%', '/']),
          buildButtonRow(['7', '8', '9', '*']),
          buildButtonRow(['4', '5', '6', '-']),
          buildButtonRow(['1', '2', '3', '+']),
          buildButtonRow(['0', '.', '=']),
          const SizedBox(height: 10.0),
        ],

      ),
    );
  }
/*Aqui finaliza contenedor de diseño de la calculadora*/

/*Funcionalidad*/

  Widget buildButtonRow(List<String> buttons) {/*representa los textos de los botones que se van a construir. El método devuelve un widget que será una fila de botones */
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,/*distribuye el espacio entre los botones de manera uniforme*/
      children: buttons.map((btnText) {/*Se utiliza el método map para transformar cada texto de botón en un widget de botón. btnText representa el texto de cada botón en la lista */
        if (btnText == 'AC') {
          return buildButton(btnText, const Color.fromARGB(255, 193, 46, 238), clearAll);
        } else if (btnText == '=') {
          return buildButton(btnText, const Color.fromARGB(255, 255, 238, 80), evaluateExpression);
        } else if (btnText == 'C') {
          return buildButton(btnText, const Color.fromARGB(255, 193, 46, 238), deleteLast);
        } else {
          return buildButton(btnText, const Color.fromARGB(255, 255, 255, 255), () {
            setState(() {
              txtEntrada.text += btnText;
            });
          });
        }
      }).toList(),/*El resultado de map se convierte en una lista utilizando toList(), que se asigna a la propiedad children del widget Row.
      */
    );
  }

  Widget buildButton(String text, Color color, Function() onPressed) {/*contenedor para texto de los botones */
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 28.0,
            color: Color.fromARGB(255, 5, 5, 5),
            fontFamily: 'RobotoMono',
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(18.0),
          shape: const CircleBorder(),
        ),
      ),
    );
  }

  void clearAll() {/*Metodo de limpiar */
    setState(() {
      txtEntrada.clear();
      txtResultado.clear();
    });
  }

  void deleteLast() {/*metodo de eliminar */
    setState(() {
      if (txtEntrada.text.isNotEmpty) {
        txtEntrada.text = txtEntrada.text.substring(0, txtEntrada.text.length - 1);
      }
    });
  }

  void evaluateExpression() {/**/
    Parser p = Parser();/*analiza la cadena de texto*/
    ContextModel cm = ContextModel();/*Este objeto se utiliza para manejar el contexto en el que se evalúa la expresión. Puede contener variables y otros elementos necesarios para la evaluación*/
    try {
      Expression exp = p.parse(txtEntrada.text);
      setState(() {
        txtResultado.text = exp.evaluate(EvaluationType.REAL, cm).toString();
      });
    } catch (e) {
      setState(() {
        txtResultado.text = "Error";
      });
    }
  }
}

