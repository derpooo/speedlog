import 'package:flutter/material.dart';

class RegistrarMotorista extends StatelessWidget {
  const RegistrarMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Motorista', style: TextStyle(color: Colors.yellow)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.yellow),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome Completo',
                labelStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.yellow),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.yellow),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'CPF',
                labelStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.yellow),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'CNH',
                labelStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.yellow),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tipo de Carro',
                labelStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
                hintText: 'Ex: Fiat Uno, VW Gol, etc.',
                hintStyle: TextStyle(color: Colors.yellow.withOpacity(0.5)),
              ),
              style: TextStyle(color: Colors.yellow),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Placa do Veículo',
                labelStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.yellow),
              textCapitalization: TextCapitalization.characters,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.yellow),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                labelStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.yellow),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
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
