import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showLoginFields = false;
  String userType = 'Cliente';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/logo.png', height: 100),
            Text('SPEEDLOG', style: TextStyle(color: Colors.yellow, fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            if (!showLoginFields) ...[
              DropdownButton<String>(
                value: userType,
                dropdownColor: Colors.black,
                style: TextStyle(color: Colors.yellow),
                items: ['Cliente', 'Motorista'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    userType = newValue!;
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: () {
                  setState(() {
                    showLoginFields = true;
                  });
                },
                child: Text('Login', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('Cadastro', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.login, color: Colors.yellow, size: 40),
                  Icon(Icons.facebook, color: Colors.yellow, size: 40),
                  Icon(Icons.apple, color: Colors.yellow, size: 40),
                ],
              ),
            ] else ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text('Login como: $userType', style: TextStyle(color: Colors.yellow, fontSize: 18)),
                    SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Senha', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Text('Entrar', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
