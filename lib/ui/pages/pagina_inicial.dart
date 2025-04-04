import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _EstadoPaginaInicial createState() => _EstadoPaginaInicial();
}

class _EstadoPaginaInicial extends State<PaginaInicial> {
  final List<String> categorias = ["Mercado", "Saúde", "Pets", "Móveis/Eletrodomésticos"];
  String categoriaSelecionada = "Mercado";

  final List<Map<String, dynamic>> motoristas = [
    {
      'nome': 'João',
      'categorias': ['Mercado', 'Pets']
    },
    {
      'nome': 'Maria',
      'categorias': ['Saúde', 'Móveis/Eletrodomésticos']
    },
    {
      'nome': 'Carlos',
      'categorias': ['Mercado', 'Saúde']
    },
    {
      'nome': 'Ana',
      'categorias': ['Pets', 'Móveis/Eletrodomésticos']
    },
    {
      'nome': 'Pedro',
      'categorias': ['Mercado']
    },
  ];

  final Map<String, List<String>> itensPorCategoria = {
    "Mercado": ["Arroz", "Feijão", "Leite", "Pão", "Ovos"],
    "Saúde": ["Remédios", "Vitaminas", "Máscaras", "Álcool Gel"],
    "Pets": ["Ração", "Brinquedos", "Petiscos", "Areia para gatos"],
    "Móveis/Eletrodomésticos": ["Sofá", "Geladeira", "Fogão", "Cadeira"]
  };

  @override
  Widget build(BuildContext context) {
    // Filtrar motoristas conforme a categoria selecionada
    List<Map<String, dynamic>> motoristasFiltrados = motoristas
        .where((motorista) => motorista['categorias'].contains(categoriaSelecionada))
        .toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text('Início', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Rolagem horizontal dos motoristas filtrados
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: motoristasFiltrados.length,
              separatorBuilder: (context, index) => SizedBox(width: 15),
              itemBuilder: (context, index) {
                var motorista = motoristasFiltrados[index];
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.yellow,
                      child: Icon(Icons.person, color: Colors.black, size: 40),
                    ),
                    SizedBox(height: 5),
                    Text(
                      motorista['nome'],
                      style: TextStyle(color: Colors.yellow, fontSize: 14),
                    ),
                  ],
                );
              },
            ),
          ),

          Divider(color: Colors.yellow),

          // Seleção de categorias
          SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                String categoria = categorias[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      categoriaSelecionada = categoria;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      categoria,
                      style: TextStyle(
                        color: categoriaSelecionada == categoria ? Colors.yellow : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Divider(color: Colors.yellow),

          // Lista de itens da categoria selecionada
          Expanded(
            child: ListView.builder(
              itemCount: itensPorCategoria[categoriaSelecionada]?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    itensPorCategoria[categoriaSelecionada]![index],
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(Icons.circle, color: Colors.yellow),
                );
              },
            ),
          ),
        ],
      ),

      // Barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
