import 'package:flutter/material.dart';

class ItemBusca extends StatelessWidget {
  final String nome;
  final String descricao;

  const ItemBusca({
    super.key,
    required this.nome,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.shopping_basket, color: Colors.yellow),
      title: Text(
        nome,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            descricao,
            style: const TextStyle(color: Colors.black54),
          ),
        ),
      ],
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

  // Agora cada item tem uma descrição associada
  final Map<String, String> itensComDescricao = {
    "Arroz": "Arroz branco tipo 1, pacote de 5kg.",
    "Feijão": "Feijão carioca, pacote de 1kg.",
    "Leite": "Leite integral, caixa de 1L.",
    "Pão": "Pão francês, unidade.",
    "Ovos": "Bandeja com 12 ovos.",
    "Remédios": "Medicamentos diversos para sua saúde.",
    "Vitaminas": "Suplementos vitamínicos para bem-estar.",
    "Máscaras": "Máscaras de proteção facial descartáveis.",
    "Álcool Gel": "Álcool em gel 70%, frasco de 500ml.",
    "Ração": "Ração premium para cães e gatos.",
    "Brinquedos": "Brinquedos para diversão do seu pet.",
    "Petiscos": "Petiscos saudáveis para animais.",
    "Areia para gatos": "Areia higiênica para gatos.",
    "Sofá": "Sofá de 3 lugares, tecido suede.",
    "Geladeira": "Geladeira frost free, 300L.",
    "Fogão": "Fogão 4 bocas com acendimento automático.",
    "Cadeira": "Cadeira de escritório ergonômica.",
  };

  List<Map<String, String>> get resultados => itensComDescricao.entries
      .where((item) =>
          item.key.toLowerCase().contains(termoBusca.toLowerCase()))
      .map((e) => {'nome': e.key, 'descricao': e.value})
      .toList();

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
      body: resultados.isEmpty
          ? const Center(
              child: Text(
                'Nenhum item encontrado.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: resultados.length,
              itemBuilder: (context, index) {
                final item = resultados[index];
                return ItemBusca(
                  nome: item['nome']!,
                  descricao: item['descricao']!,
                );
              },
            ),
    );
  }
}
