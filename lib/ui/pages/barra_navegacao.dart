import 'package:flutter/material.dart';
import 'pagina_inicial.dart';
import 'pagina_busca.dart';
import 'pagina_perfil.dart';

class BarraNavegacao extends StatefulWidget {
  const BarraNavegacao({super.key});

  @override
  _BarraNavegacaoState createState() => _BarraNavegacaoState();
}

class _BarraNavegacaoState extends State<BarraNavegacao> {
  final PageController _pageController = PageController();
  int _indiceAtual = 0;

  final List<Widget> _pages = [
    PaginaInicial(),
    PaginaBusca(),
    Container(color: Colors.black), 
    PagPerfil(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomAppBar(
            color: Colors.black,
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, 
                      color: _indiceAtual == 0 ? Colors.yellow : Colors.white),
                    onPressed: () => _onItemTapped(0),
                  ),
                  IconButton(
                    icon: Icon(Icons.search,
                      color: _indiceAtual == 1 ? Colors.yellow : Colors.white),
                    onPressed: () => _onItemTapped(1),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today,
                      color: _indiceAtual == 2 ? Colors.yellow : Colors.white),
                    onPressed: () => _onItemTapped(2),
                  ),
                  IconButton(
                    icon: Icon(Icons.person,
                      color: _indiceAtual == 3 ? Colors.yellow : Colors.white),
                    onPressed: () => _onItemTapped(3),
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