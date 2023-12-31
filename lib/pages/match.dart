import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cahb/models/match_model.dart';
import 'package:cahb/pages/mywidgets/match_list_section.dart';
import 'package:cahb/services/api_service.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  late Future<List<Game>> currentGamesData;
  late Future<List<Game>> comingGamesData;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    currentGamesData = ApiService().fetchCurrentMatches();
    comingGamesData = ApiService().fetchComingMatches();
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer t) => setState(() {
        currentGamesData = ApiService().fetchCurrentMatches();
        comingGamesData = ApiService().fetchComingMatches();
      }),
    );
  }

  @override
  void dispose() {
    // Arrête le timer lorsque le widget est détruit
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 243, 243, 243),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Container(
                color: Colors.white,
                child: FutureBuilder<List<Game>>(
                  future:
                      currentGamesData, // Remplacez cela par l'appel à votre endpoint approprié
                  builder: (context, snapshot) {
                    // if (snapshot.connectionState == ConnectionState.waiting) {
                    //   return const Center(child: CircularProgressIndicator());
                    // }
                     if (snapshot.hasError) {
                      return const Center(child: Text('Erreur : vérifiez votre connexion internet!'));
                    } 
                    if (snapshot.hasData) {
                      final matches = snapshot.data!;
                      return MatchListSection(
                        matches: matches,
                        titleSection: 'En cours',
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            Card(
              elevation: 4,
              child: Container(
                color: Colors.white,
                child: FutureBuilder<List<Game>>(
                  future:
                      comingGamesData, // Remplacez cela par l'appel à votre endpoint approprié
                  builder: (context, snapshot) {
                    // if (snapshot.connectionState == ConnectionState.waiting) {
                    //   return const Center(child: CircularProgressIndicator());
                    // } 
                    if (snapshot.hasError) {
                      return const Center(child: Text('Erreur : vérifiez votre connexion internet!'));
                    } 
                    if (snapshot.hasData) {
                      final matches = snapshot.data!;
                      return MatchListSection(
                        matches: matches,
                        titleSection: 'A venir',
                      );
                    }else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
