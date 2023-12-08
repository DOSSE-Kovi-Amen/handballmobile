import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hanballmobile/pages/about.dart';
import 'package:hanballmobile/pages/competitions.dart';
import 'package:hanballmobile/pages/privacy.dart';

void main() {
  // Définir la couleur de la barre de navigation système
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromRGBO(27, 106, 173, 1),
      systemStatusBarContrastEnforced: true // Couleur de la barre de navigation
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Handball',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Handball TOGO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const CompetionScreen(),
    const CompetionScreen(),
    const CompetionScreen(),
    const PrivacyScreen(),
    const AboutScreen()
  ];
  final List<AppBar> _appBars = [
    AppBar(
      backgroundColor: const Color.fromRGBO(27, 106, 173, 1),
      title: const Text("Compétitions",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:20)),
    ),
        AppBar(
      backgroundColor: const Color.fromRGBO(27, 106, 173, 1),
      title: const Text("Matchs",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize:20)),
    ),
        AppBar(
      backgroundColor: const Color.fromRGBO(27, 106, 173, 1),
      title: const Text("Recherche",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize:20)),
    ),
        AppBar(
      backgroundColor: const Color.fromRGBO(27, 106, 173, 1),
      title: const Text("Politique de confidentialité",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize:20)),
    ),
        AppBar(
      backgroundColor: const Color.fromRGBO(27, 106, 173, 1),
      title: const Text("A propos",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize:20)),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_currentIndex],
      body: _pages[_currentIndex],
      // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Compétitions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Matchs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Politiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
            label: 'A propos',
          ),
        ],
        // backgroundColor: Colors.blue,
        showUnselectedLabels: true,
        selectedItemColor: const Color.fromRGBO(27, 106, 173, 1), // Couleur des onglets sélectionnés
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
            color: Colors.white), // Couleur du texte pour l'onglet sélectionné
        unselectedLabelStyle: const TextStyle(
            color: Colors
                .grey), // Couleur du texte pour les onglets non sélectionnés
        iconSize: 20,
        elevation: 15,
        // Couleur des onglets non sélectionnés
      ),
    );
  }
}
