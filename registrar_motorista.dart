import 'package:flutter/material.dart';

class RegistrarMotorista extends StatelessWidget {
  const RegistrarMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Motorista', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome Completo',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'CPF',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'CNH',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tipo de Carro',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                hintText: 'Ex: Fiat Uno, VW Gol, etc.',
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Placa do Veículo',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black),
              textCapitalization: TextCapitalization.characters,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Cadastro realizado com sucesso!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text('Registrar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
