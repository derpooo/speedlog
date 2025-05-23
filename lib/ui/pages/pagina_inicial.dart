import 'package:flutter/material.dart';
import 'selecionar_motorista.dart';

// Modelo para dados do produto
class Produto {
  final String nome;
  final String categoria;
  final double preco;
  int quantidade;

  Produto({required this.nome, required this.categoria, required this.preco, this.quantidade = 0});
}


class ChipCategoria extends StatelessWidget {
  final String categoria;
  final bool selecionado;
  final VoidCallback aoSelecionar;

  const ChipCategoria({
    super.key,
    required this.categoria,
    required this.selecionado,
    required this.aoSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        label: Text(
          categoria,
          style: TextStyle(
            color: selecionado ? Colors.black : Colors.white,
          ),
        ),
        selected: selecionado,
        selectedColor: Colors.yellow,
        backgroundColor: Colors.black,
        onSelected: (_) => aoSelecionar(),
      ),
    );
  }
}

class CardProduto extends StatelessWidget {
  final Produto produto;
  final int quantidadeNoCarrinho;
  final VoidCallback aoAdicionar;
  final VoidCallback aoRemover;

  const CardProduto({
    super.key,
    required this.produto,
    required this.quantidadeNoCarrinho,
    required this.aoAdicionar,
    required this.aoRemover,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _obterIconeCategoria(produto.categoria),
                color: Colors.black,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nome,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "R\$ ${produto.preco.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
            ),
            if (quantidadeNoCarrinho > 0) ...[
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: aoRemover,
                color: Colors.red,
              ),
              Text(
                quantidadeNoCarrinho.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: aoAdicionar,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  IconData _obterIconeCategoria(String categoria) {
    switch (categoria) {
      case 'Mercado':
        return Icons.shopping_basket;
      case 'Saúde':
        return Icons.medical_services;
      case 'Pets':
        return Icons.pets;
      case 'Móveis/Eletrodomésticos':
        return Icons.chair;
      default:
        return Icons.category;
    }
  }
}

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  _EstadoPaginaInicial createState() => _EstadoPaginaInicial();
}

class _EstadoPaginaInicial extends State<PaginaInicial> {
  final List<String> categorias = ["Mercado", "Saúde", "Pets", "Móveis/Eletrodomésticos"];
  String categoriaSelecionada = "Mercado";
  final Map<String, List<Produto>> produtosPorCategoria = {
    "Mercado": [
      Produto(nome: "Arroz", categoria: "Mercado", preco: 25.90),
      Produto(nome: "Feijão", categoria: "Mercado", preco: 8.90),
      Produto(nome: "Leite", categoria: "Mercado", preco: 4.50),
      Produto(nome: "Pão", categoria: "Mercado", preco: 12.90),
      Produto(nome: "Ovos", categoria: "Mercado", preco: 15.90),
    ],
    "Saúde": [
      Produto(nome: "Remédios", categoria: "Saúde", preco: 45.90),
      Produto(nome: "Vitaminas", categoria: "Saúde", preco: 35.90),
      Produto(nome: "Máscaras", categoria: "Saúde", preco: 19.90),
      Produto(nome: "Álcool Gel", categoria: "Saúde", preco: 15.90),
    ],
    "Pets": [
      Produto(nome: "Ração", categoria: "Pets", preco: 89.90),
      Produto(nome: "Brinquedos", categoria: "Pets", preco: 29.90),
      Produto(nome: "Petiscos", categoria: "Pets", preco: 19.90),
      Produto(nome: "Areia para gatos", categoria: "Pets", preco: 39.90),
    ],
    "Móveis/Eletrodomésticos": [
      Produto(nome: "Sofá", categoria: "Móveis/Eletrodomésticos", preco: 1299.90),
      Produto(nome: "Geladeira", categoria: "Móveis/Eletrodomésticos", preco: 2499.90),
      Produto(nome: "Fogão", categoria: "Móveis/Eletrodomésticos", preco: 899.90),
      Produto(nome: "Cadeira", categoria: "Móveis/Eletrodomésticos", preco: 199.90),
    ]
  };

  List<Produto> get carrinho => produtosPorCategoria.values
      .expand((produtos) => produtos)
      .where((produto) => produto.quantidade > 0)
      .toList();

  double get total => carrinho.fold(
        0,
        (soma, produto) => soma + (produto.preco * produto.quantidade),
      );

  void _adicionarAoCarrinho(Produto produto) {
    setState(() => produto.quantidade++);
  }

  void _removerDoCarrinho(Produto produto) {
    setState(() {
      if (produto.quantidade > 0) produto.quantidade--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Seleção de categoria
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  final categoria = categorias[index];
                  return ChipCategoria(
                    categoria: categoria,
                    selecionado: categoriaSelecionada == categoria,
                    aoSelecionar: () => setState(() => categoriaSelecionada = categoria),
                  );
                },
              ),
            ),

            // Lista de produtos
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: produtosPorCategoria[categoriaSelecionada]?.length ?? 0,
                itemBuilder: (context, index) {
                  final produto = produtosPorCategoria[categoriaSelecionada]![index];
                  return CardProduto(
                    produto: produto,
                    quantidadeNoCarrinho: produto.quantidade,
                    aoAdicionar: () => _adicionarAoCarrinho(produto),
                    aoRemover: () => _removerDoCarrinho(produto),
                  );
                },
              ),
            ),

            // Botão de finalizar pedido
            if (carrinho.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelecionarMotorista(
                              carrinho: carrinho.map((p) => {
                                'nome': p.nome,
                                'preco': p.preco,
                                'quantidade': p.quantidade,
                              }).toList(),
                              total: total,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Finalizar Pedido (R\$ ${total.toStringAsFixed(2)})',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
