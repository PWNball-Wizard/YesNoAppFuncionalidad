//! crear una clase que contenga los colores y estilos de la aplicación

import 'package:flutter/material.dart';

List<Color> _colors = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.indigo,
  Colors.amber,
  Colors.lime,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];

class AppTheme {
  int colorIndex;

  AppTheme({
    required this.colorIndex,
  }) : assert(colorIndex < _colors.length
            ? true
            : throw 'Color index out of bounds');
  //! Las aserciiones sirven para verificar que una condición es verdadera, si no lo es, se lanza una excepción
  //! en este caso se verifica que el índice de color sea menor que la longitud de la lista de colores

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        //primarySwatch: Colors.blue,
        colorSchemeSeed: _colors[colorIndex],
        brightness: Brightness.dark);
  }
}
