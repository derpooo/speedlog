import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _EstadoPaginaInicial createState() => _EstadoPaginaInicial();
}

class _EstadoPaginaInicial extends State<PaginaInicial> {
  int _indiceAtual = 0; // Controla o índice da Bottom Navigation

  final List<String> categorias = ["Mercado", "Saúde", "Pets", "Móveis/Eletrodomésticos"];
  String categoriaSelecionada = "Mercado";

  final List<Map<String, dynamic>> motoristas = [
    {'nome': 'João', 'categorias': ['Mercado', 'Pets']},
    {'nome': 'Maria', 'categorias': ['Saúde', 'Móveis/Eletrodomésticos']},
    {'nome': 'Carlos', 'categorias': ['Mercado', 'Saúde']},
    {'nome': 'Ana', 'categorias': ['Pets', 'Móveis/Eletrodomésticos']},
    {'nome': 'Pedro', 'categorias': ['Mercado']},
  ];

  final Map<String, List<String>> itensPorCategoria = {
    "Mercado": ["Arroz", "Feijão", "Leite", "Pão", "Ovos"],
    "Saúde": ["Remédios", "Vitaminas", "Máscaras", "Álcool Gel"],
    "Pets": ["Ração", "Brinquedos", "Petiscos", "Areia para gatos"],
    "Móveis/Eletrodomésticos": ["Sofá", "Geladeira", "Fogão", "Cadeira"]
  };

  @override
  Widget build(BuildContext context) {
    //  Filtra os motoristas com base na categoria selecionada
    List<Map<String, dynamic>> motoristasFiltrados = motoristas
        .where((motorista) => motorista['categorias'].contains(categoriaSelecionada))
        .toList();

    return Scaffold(
      extendBody: true, // Faz a Bottom Navigation flutuar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
        'lib/assets/logo2.png',
        height: 40),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          //  Mostra apenas motoristas compatíveis com a categoria
          SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
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
              )
            ),
          ),

          //  Botões para selecionar categorias (motoristas também são filtrados)
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
                        color: categoriaSelecionada == categoria ? Colors.yellow : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Lista de itens filtrados da categoria selecionada
          Expanded(
            child: ListView.builder(
              itemCount: itensPorCategoria[categoriaSelecionada]?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    itensPorCategoria[categoriaSelecionada]![index],
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Icon(Icons.circle, color: Colors.black),
                );
              },
            ),
          ),
        ],
      ),

      //  Bottom Navigation Customizada
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50), // Bordas arredondadas
          child: BottomAppBar(
            color: Colors.black,
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: _indiceAtual == 0 ? Colors.yellow : Colors.white),
                    onPressed: () => setState(() => _indiceAtual = 0),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: _indiceAtual == 1 ? Colors.yellow : Colors.white),
                    onPressed: () => setState(() => _indiceAtual = 1),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: _indiceAtual == 2 ? Colors.yellow : Colors.white),
                    onPressed: () => setState(() => _indiceAtual = 2),
                  ),
                  IconButton(
                    icon: Icon(Icons.person, color: _indiceAtual == 3 ? Colors.yellow : Colors.white),
                    onPressed: () => setState(() => _indiceAtual = 3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
