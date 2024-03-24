import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/pagina1.dart';
import 'package:trilhaapp/pages/pagina2.dart';
import 'package:trilhaapp/pages/pagina3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meu App"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DadosCadastraisPage(),
                          ));
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: const Text("Dados cadastrais"))),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: const Text("Termos de uso e privacidade"))),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: const Text("Configurações"))),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [Pagina1Page(), Pagina2Page(), Pagina3Page()],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Pagina 1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Pagina 2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Pagina 3", icon: Icon(Icons.person))
                ])
          ],
        ),
      ),
    );
  }
}
