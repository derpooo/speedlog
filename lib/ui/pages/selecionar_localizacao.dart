import 'package:flutter/material.dart';
import 'barra_navegacao.dart';

class SelecionarLocalizacao extends StatelessWidget {
  final String nomeMotorista;
  final double totalPedido;
  final double taxaEntrega;

  const SelecionarLocalizacao({
    super.key,
    required this.nomeMotorista,
    required this.totalPedido,
    required this.taxaEntrega,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selecionar Localização',
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Mapa Simulado
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.map, size: 64, color: Colors.black54),
                    const SizedBox(height: 16),
                    const Text(
                      'Mapa Aqui',
                      style: TextStyle(fontSize: 24, color: Colors.black54),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                      onPressed: () {
                        // Simular seleção de localização
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BarraNavegacao(initialIndex: 2),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        'Confirmar Localização',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Detalhes do pedido
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detalhes do Pedido',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Motorista: $nomeMotorista',
                  style: const TextStyle(color: Colors.black87),
                ),
                Text(
                  'Total dos itens: R\$ ${totalPedido.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.black87),
                ),
                Text(
                  'Taxa de entrega: R\$ ${taxaEntrega.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.black87),
                ),
                Text(
                  'Total final: R\$ ${(totalPedido + taxaEntrega).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 