import 'package:flutter/material.dart';


class TrackingScreen extends StatelessWidget {
  final List<String> trackingHistory = ['FU84593276', 'AHDR573'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acompanhar pedidos'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de pesquisa
            TextField(
              decoration: InputDecoration(
                hintText: 'MAB4561259',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Título da seção de histórico
            Text(
              'Tracking History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Lista de histórico
            Expanded(
              child: ListView.builder(
                itemCount: trackingHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(trackingHistory[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        // Lógica para remover o item pode ser adicionada aqui
                      },
                    ),
                  );
                },
              ),
            ),
            // Botão para deletar todos
            TextButton(
              onPressed: () {
                // Lógica para deletar todos pode ser adicionada aqui
              },
              child: Text('Delete All'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Você pode mudar isso conforme necessário
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}