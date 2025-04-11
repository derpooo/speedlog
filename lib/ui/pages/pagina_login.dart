import 'package:flutter/material.dart';
import 'pagina_inicial.dart'; // novo nome do arquivo traduzido
import 'pagina_cadastro.dart'; // novo nome do arquivo traduzido

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({super.key});

  @override
  _EstadoPaginaLogin createState() => _EstadoPaginaLogin();
}

class _EstadoPaginaLogin extends State<PaginaLogin> {
  bool mostrarCamposLogin = false;
  String tipoUsuario = 'Cliente';

  final TextEditingController controladorEmail = TextEditingController();
  final TextEditingController controladorSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/logo.png', height: 100),
            SizedBox(height: 20),

            if (!mostrarCamposLogin) ...[
              DropdownButton<String>(
                value: tipoUsuario,
                dropdownColor: Colors.black,
                style: TextStyle(color: Colors.yellow),
                items: ['Cliente', 'Motorista'].map((String valor) {
                  return DropdownMenuItem<String>(
                    value: valor,
                    child: Text(valor),
                  );
                }).toList(),
                onChanged: (String? novoValor) {
                  setState(() {
                    tipoUsuario = novoValor!;
                  });
                },
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: () {
                  setState(() {
                    mostrarCamposLogin = true;
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
                    MaterialPageRoute(builder: (context) => PaginaCadastro()),
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
            ]
            else ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text('Login como: $tipoUsuario', style: TextStyle(color: Colors.yellow, fontSize: 18)),
                    SizedBox(height: 10),

                    TextField(
                      controller: controladorEmail,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 10),

                    TextField(
                      controller: controladorSenha,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaginaInicial()),
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
