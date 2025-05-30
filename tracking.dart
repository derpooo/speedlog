import 'package:flutter/material.dart';


class DetailLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Location'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Mapa Simulado
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Center(
                child: Text(
                  'Mapa Aqui',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
            ),
          ),
          // Detalhes da Localização
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seu pacote está a caminho',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Chegando ao ponto de coleta em 2 minutos',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.person, size: 40),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Harry Johnson', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('4.5', style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.phone, color: Colors.black),
                  ],
                ),
                SizedBox(height: 8),
                Text('123 Washington Blvd, Belpre, OH'),
                Text('121 Pike St, Marietta, OH'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: Colors.yellow,
      ),
    );
  }
}