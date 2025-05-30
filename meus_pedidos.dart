import 'package:flutter/material.dart';

class MeusPedidos extends StatelessWidget {
  const MeusPedidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Meus Pedidos',
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barra de busca
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.yellow),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Coloque o número de rastreamento',
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Filtros
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                filtroChip('Tudo'),
                filtroChip('Em Andamento'),
                filtroChip('Entregue'),
              ],
            ),
            const SizedBox(height: 16),

            // Lista de pedidos
            Expanded(
              child: ListView(
                children: [
                  pedidoItem('AHDR573', 'Entregue', 'João Silva'),
                  pedidoItem('MA845612589', 'Em Andamento', 'Maria Santos'),
                  pedidoItem('FUB45932376', 'Entregue', 'Carlos Oliveira'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para o chip de filtro
  Widget filtroChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.yellow),
      ),
    );
  }

  // Widget para item de pedido
  Widget pedidoItem(String codigo, String status, String motorista) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.local_shipping, color: Colors.yellow),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        codigo,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Motorista: $motorista',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: status == 'Entregue' ? Colors.grey : Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: status == 'Entregue' ? Colors.white : Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              alignment: WrapAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility, color: Colors.black),
                  label: const Text(
                    'Ver Detalhes',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.phone, color: Colors.black),
                  label: const Text(
                    'Contatar Motorista',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
