import 'package:flutter/material.dart';
import 'pagina_login.dart';
import 'pagina_busca.dart';
import 'pagina_inicial.dart';

class PagPerfil extends StatefulWidget {
  const PagPerfil({super.key});

  @override
  _MyProfilesPageState createState() => _MyProfilesPageState();
}

class _MyProfilesPageState extends State<PagPerfil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          // Profile Section
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.yellow,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Nome do Usuário',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'usuario@email.com',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Settings Section
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.yellow),
                  title: Text(
                    'Configurações',
                    style: TextStyle(color: Colors.yellow, fontSize: 16),
                  ),
                  trailing: Icon(Icons.chevron_right, color: Colors.yellow),
                  onTap: () {
                    
                  },
                ),
              ],
            ),
          ),

          
          Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaLogin()),
                  (route) => false,
                );
              },
              child: Text(
                'Sair',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      
        
      
    );
  }
}
