import 'package:flutter/material.dart';
//feito 
void main() {
  runApp(const SpeedLogApp());
}

class SpeedLogApp extends StatelessWidget {
  const SpeedLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpeedLog',
      debugShowCheckedModeBanner: false,
      home: const RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Logo
                Image.asset(
                  'assets/logo.png', // Substitua com o caminho do seu logo
                  height: 100,
                ),
                const SizedBox(height: 10),
                const Text(
                  'SPEEDLOG',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 40),
                // Campos de entrada
                CustomInputField(hint: 'Email'),
                CustomInputField(hint: 'Nome completo'),
                CustomInputField(hint: 'CPF'),
                CustomInputField(hint: 'Tipo de veículo'),
                CustomInputField(hint: 'Placa do veículo'),
                CustomInputField(hint: 'Senha', obscureText: true),
                CustomInputField(hint: 'Confirme sua senha', obscureText: true),
                const SizedBox(height: 20),
                // Botão registrar
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Ação de registro
                    },
                    child: const Text('Registrar-se'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String hint;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.hint,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        obscureText: obscureText,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: const Color(0xFFF0EFFF),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
