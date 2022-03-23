import 'package:flutter/material.dart';

import 'moedas_page.dart';
import 'favoritesPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pagPresent = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: pagPresent);
  }

  setPagPresent(pag) {
    setState(() {
      pagPresent = pag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: const [
          MoedasPage(),
          FavoritesPage(),
        ],
        onPageChanged: setPagPresent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pagPresent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todas'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos')
        ],
        onTap: (pag) {
          pc.animateToPage(pag,
              duration: const Duration(milliseconds: 400), curve: Curves.ease);
        },
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}
