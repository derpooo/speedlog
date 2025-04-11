import 'package:flutter/material.dart';

class PaginaBusca extends StatefulWidget {
  @override
  _PaginaBuscaState createState() => _PaginaBuscaState();
}

class _PaginaBuscaState extends State<PaginaBusca> {
  String termoBusca = "";

  final Map<String, List<String>> itensPorCategoria = {
    "Mercado": ["Arroz", "Feijão", "Leite", "Pão", "Ovos"],
    "Saúde": ["Remédios", "Vitaminas", "Máscaras", "Álcool Gel"],
    "Pets": ["Ração", "Brinquedos", "Petiscos", "Areia para gatos"],
    "Móveis/Eletrodomésticos": ["Sofá", "Geladeira", "Fogão", "Cadeira"]
  };

  @override
  Widget build(BuildContext context) {
    List<String> todosOsItens = itensPorCategoria.values.expand((list) => list).toList();
    List<String> resultados = todosOsItens
        .where((item) => item.toLowerCase().contains(termoBusca.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Buscar itens...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white54),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (valor) {
            setState(() {
              termoBusca = valor;
            });
          },
        ),
        iconTheme: IconThemeData(color: Colors.yellow),
      ),
      body: ListView.builder(
        itemCount: resultados.length,
        itemBuilder: (context, index) {
          String item = resultados[index];
          return ListTile(
            leading: Icon(Icons.shopping_basket, color: Colors.yellow),
            title: Text(item, style: TextStyle(fontWeight: FontWeight.w500)),
            onTap: () {
              // ação ao tocar no item (pode ir para uma página de detalhes ou adicionar ao carrinho, por exemplo)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Você selecionou "$item"')),
              );
            },
          );
        },
      ),
    );
  }
}