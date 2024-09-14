import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //! El title es el título de la aplicación que se muestra en la barra de tareas
      title: 'Yes No App',
      //! debugShowCheckedModeBanner es un booleano que muestra o no la cinta de depuración en la parte superior derecha de la aplicación
      debugShowCheckedModeBanner: false,
      theme: AppTheme(colorIndex: 2).theme(),
      home: const Scaffold(
        //! El appBar es la barra de título de la aplicación
        /* appBar: AppBar(
          title: const Text('Yes No App'),
        ), */
        body: Center(
          child: ChatScreen(),
        ),
      ),
    );
  }
}
