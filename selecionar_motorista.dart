import 'package:flutter/material.dart';
import 'barra_navegacao.dart';
import 'track_vazia.dart';
import 'selecionar_localizacao.dart';

class Motorista {
  final String nome;
  final List<String> categorias;
  final String veiculo;
  final double avaliacao;
  final double taxa;

  const Motorista({
    required this.nome,
    required this.categorias,
    required this.veiculo,
    required this.avaliacao,
    required this.taxa,
  });
}

class CardMotorista extends StatelessWidget {
  final Motorista motorista;
  final double totalPedido;
  final VoidCallback aoSelecionar;

  const CardMotorista({
    super.key,
    required this.motorista,
    required this.totalPedido,
    required this.aoSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Icon(Icons.person, color: Colors.black),
        ),
        title: Text(
          motorista.nome,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Veículo: ${motorista.veiculo}',
              style: const TextStyle(color: Colors.black87),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 16),
                Text(
                  ' ${motorista.avaliacao}',
                  style: const TextStyle(color: Colors.black87),
                ),
                const SizedBox(width: 10),
                Text(
                  'Taxa: R\$ ${motorista.taxa.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ],
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
          ),
          onPressed: () => _mostrarDialogoConfirmacao(context),
          child: const Text(
            'Selecionar',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoConfirmacao(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Pedido'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Motorista: ${motorista.nome}'),
            Text('Total dos itens: R\$ ${totalPedido.toStringAsFixed(2)}'),
            Text('Taxa de entrega: R\$ ${motorista.taxa.toStringAsFixed(2)}'),
            Text(
              'Total final: R\$ ${(totalPedido + motorista.taxa).toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SelecionarLocalizacao(
                    nomeMotorista: motorista.nome,
                    totalPedido: totalPedido,
                    taxaEntrega: motorista.taxa,
                  ),
                ),
                (route) => false,
              );
            },
            child: const Text(
              'Confirmar',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class SelecionarMotorista extends StatelessWidget {
  final List<Map<String, dynamic>> carrinho;
  final double total;

  const SelecionarMotorista({
    super.key,
    required this.carrinho,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final List<Motorista> motoristas = const [
      Motorista(
        nome: 'João Silva',
        categorias: ['Mercado', 'Pets'],
        veiculo: 'Van',
        avaliacao: 4.8,
        taxa: 15.0,
      ),
      Motorista(
        nome: 'Maria Santos',
        categorias: ['Saúde', 'Móveis/Eletrodomésticos'],
        veiculo: 'Caminhão',
        avaliacao: 4.9,
        taxa: 20.0,
      ),
      Motorista(
        nome: 'Carlos Oliveira',
        categorias: ['Mercado', 'Saúde'],
        veiculo: 'Van',
        avaliacao: 4.7,
        taxa: 15.0,
      ),
      Motorista(
        nome: 'Ana Pereira',
        categorias: ['Pets', 'Móveis/Eletrodomésticos'],
        veiculo: 'Caminhão',
        avaliacao: 4.6,
        taxa: 20.0,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selecionar Motorista',
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Resumo do pedido
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Resumo do Pedido',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Total dos itens: R\$ ${total.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  'Quantidade de itens: ${carrinho.length}',
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),

          // Lista de motoristas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: motoristas.length,
              itemBuilder: (context, index) {
                final motorista = motoristas[index];
                return CardMotorista(
                  motorista: motorista,
                  totalPedido: total,
                  aoSelecionar: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 