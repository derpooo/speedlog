import 'package:flutter/material.dart';
import 'ui/pages/pagina_login.dart';

class DeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpeedLog',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.yellow),
          bodyMedium: TextStyle(color: Colors.yellow),
        ),
      ),
      home: PaginaLogin(),
    );
  }
}
