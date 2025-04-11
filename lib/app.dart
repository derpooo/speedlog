import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/pages/pagina_login.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpeedLog',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: GoogleFonts.poppins(color: Colors.yellow),
          bodyMedium: GoogleFonts.poppins(color: Colors.yellow),
        ),
      ),
      home: PaginaLogin(),
    );
  }
}
