import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro', style: TextStyle(color: Colors.yellow)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nome', labelStyle: TextStyle(color: Colors.yellow)),
              style: TextStyle(color: Colors.yellow),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'E-mail', labelStyle: TextStyle(color: Colors.yellow)),
              style: TextStyle(color: Colors.yellow),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Senha', labelStyle: TextStyle(color: Colors.yellow)),
              obscureText: true,
              style: TextStyle(color: Colors.yellow),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              onPressed: () {},
              child: Text('Registrar', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

