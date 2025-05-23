import 'package:flutter/material.dart';
import 'pagina_inicial.dart';
import 'pagina_busca.dart';
import 'pagina_perfil.dart';

class ItemNavegacao extends StatelessWidget {
  final IconData icone;
  final bool selecionado;
  final VoidCallback aoPressionar;

  const ItemNavegacao({
    super.key,
    required this.icone,
    required this.selecionado,
    required this.aoPressionar,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icone,
        color: selecionado ? Colors.yellow : Colors.white,
      ),
      onPressed: aoPressionar,
    );
  }
}

class BarraNavegacao extends StatefulWidget {
  const BarraNavegacao({super.key});

  @override
  _EstadoBarraNavegacao createState() => _EstadoBarraNavegacao();
}

class _EstadoBarraNavegacao extends State<BarraNavegacao> {
  final PageController _controladorPagina = PageController();
  int _indiceAtual = 0;

  final List<Widget> _paginas = [
    PaginaInicial(),
    PaginaBusca(),
    Container(color: Colors.black), 
    PagPerfil(),
  ];

  final List<IconData> _icones = const [
    Icons.home,
    Icons.search,
    Icons.calendar_today,
    Icons.person,
  ];

  @override
  void dispose() {
    _controladorPagina.dispose();
    super.dispose();
  }

  void _aoMudarPagina(int indice) {
    setState(() => _indiceAtual = indice);
  }

  void _aoPressionarItem(int indice) {
    _controladorPagina.animateToPage(
      indice,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _controladorPagina,
        onPageChanged: _aoMudarPagina,
        children: _paginas,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomAppBar(
            color: Colors.black,
            shape: const CircularNotchedRectangle(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  _icones.length,
                  (indice) => ItemNavegacao(
                    icone: _icones[indice],
                    selecionado: _indiceAtual == indice,
                    aoPressionar: () => _aoPressionarItem(indice),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} 