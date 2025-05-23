import 'package:flutter/material.dart';

class ItemBusca extends StatelessWidget {
  final String nome;
  final VoidCallback aoSelecionar;

  const ItemBusca({
    super.key,
    required this.nome,
    required this.aoSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.shopping_basket, color: Colors.yellow),
      title: Text(
        nome,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      onTap: aoSelecionar,
    );
  }
}

class PaginaBusca extends StatefulWidget {
  const PaginaBusca({super.key});

  @override
  _EstadoPaginaBusca createState() => _EstadoPaginaBusca();
}

class _EstadoPaginaBusca extends State<PaginaBusca> {
  String termoBusca = "";

  final Map<String, List<String>> itensPorCategoria = const {
    "Mercado": ["Arroz", "Feijão", "Leite", "Pão", "Ovos"],
    "Saúde": ["Remédios", "Vitaminas", "Máscaras", "Álcool Gel"],
    "Pets": ["Ração", "Brinquedos", "Petiscos", "Areia para gatos"],
    "Móveis/Eletrodomésticos": ["Sofá", "Geladeira", "Fogão", "Cadeira"]
  };

  List<String> get resultados => itensPorCategoria.values
      .expand((lista) => lista)
      .where((item) => item.toLowerCase().contains(termoBusca.toLowerCase()))
      .toList();

  void _mostrarMensagemSelecao(BuildContext context, String item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Você selecionou "$item"',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Buscar itens...',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          onChanged: (valor) => setState(() => termoBusca = valor),
        ),
        iconTheme: const IconThemeData(color: Colors.yellow),
      ),
      body: ListView.builder(
        itemCount: resultados.length,
        itemBuilder: (context, index) {
          final item = resultados[index];
          return ItemBusca(
            nome: item,
            aoSelecionar: () => _mostrarMensagemSelecao(context, item),
          );
        },
      ),
    );
  }
}