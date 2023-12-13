import 'package:flutter/material.dart';
import 'package:hanballmobile/models/match_model.dart';
import 'package:hanballmobile/pages/mywidgets/match_list_section.dart';
import 'package:hanballmobile/services/api_service.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  late Future<List<Game>> currentGamesData;
  late Future<List<Game>> comingGamesData;

  @override
  void initState() {
    super.initState();
    currentGamesData = ApiService().fetchCurrentMatches();
    comingGamesData = ApiService().fetchComingMatches();
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
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erreur : ${snapshot.error}'));
                    } else {
                      final matches = snapshot.data!;
                      return MatchListSection(
                        matches: matches,
                        titleSection: 'En cours',
                      );
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
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erreur : ${snapshot.error}'));
                    } else {
                      final matches = snapshot.data!;
                      return MatchListSection(
                        matches: matches,
                        titleSection: 'A venir',
                      );
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
