import 'package:flutter/material.dart';
import 'pagina_busca.dart';

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
  {'nome': 'Fernanda', 'categorias': ['Mercado', 'Saúde', 'Pets']},
  {'nome': 'Ricardo', 'categorias': ['Móveis/Eletrodomésticos']},
  {'nome': 'Juliana', 'categorias': ['Saúde', 'Pets']},
  {'nome': 'Bruno', 'categorias': ['Mercado', 'Móveis/Eletrodomésticos']},
  {'nome': 'Larissa', 'categorias': ['Pets']},
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
      body: Column(
        children: [
          //  Mostra apenas motoristas compatíveis com a categoria
          SizedBox(
            height: 150,
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

              padding: EdgeInsets.all(10),
              itemCount: itensPorCategoria[categoriaSelecionada]?.length ?? 0,
              itemBuilder: (context, index) {
                String item = itensPorCategoria[categoriaSelecionada]![index];

                // Imagens genéricas de exemplo 
                final imagensExemplo = {
                  "Arroz": "https://cdn-icons-png.flaticon.com/512/1046/1046751.png",
                  "Feijão": "https://cdn-icons-png.flaticon.com/512/2909/2909593.png",
                  "Leite": "https://cdn-icons-png.flaticon.com/512/2718/2718224.png",
                  "Pão": "https://cdn-icons-png.flaticon.com/512/4387/4387742.png",
                  "Ovos": "https://cdn-icons-png.flaticon.com/512/590/590685.png",
                  "Remédios": "https://cdn-icons-png.flaticon.com/512/1474/1474769.png",
                  "Vitaminas": "https://cdn-icons-png.flaticon.com/512/2838/2838912.png",
                  "Máscaras": "https://cdn-icons-png.flaticon.com/512/3134/3134704.png",
                  "Álcool Gel": "https://cdn-icons-png.flaticon.com/512/3097/3097131.png",
                  "Ração": "https://cdn-icons-png.flaticon.com/512/616/616430.png",
                  "Brinquedos": "https://cdn-icons-png.flaticon.com/512/3105/3105927.png",
                  "Petiscos": "https://cdn-icons-png.flaticon.com/512/2933/2933828.png",
                  "Areia para gatos": "https://cdn-icons-png.flaticon.com/512/3038/3038315.png",
                  "Sofá": "https://cdn-icons-png.flaticon.com/512/1034/1034652.png",
                  "Geladeira": "https://cdn-icons-png.flaticon.com/512/3389/3389051.png",
                  "Fogão": "https://cdn-icons-png.flaticon.com/512/3710/3710565.png",
                  "Cadeira": "https://cdn-icons-png.flaticon.com/512/3442/3442377.png",
                };

                // Gera um preço aleatório só pra exemplo
                double preco = 5 + (index * 3.5);

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  ),
                  child: Row(
                   children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imagensExemplo[item] ?? "",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                          ),
                        ),
                      ),
                      Text(
                        "R\$ ${preco.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                      ),
                    ],
                  ),
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
                    onPressed: () { setState(() => _indiceAtual = 2);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaginaBusca()),
                      );
                    }
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
