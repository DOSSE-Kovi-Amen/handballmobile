import 'package:flutter/material.dart';
// import 'package:hanballmobile/models/match_model.dart';
import 'package:hanballmobile/services/api_service.dart';

class MatchDetailsPage extends StatelessWidget {
  final int matchId;

  const MatchDetailsPage({Key? key, required this.matchId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du Match'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ApiService().fetchMatchDetails(matchId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else {
            final matchDetails = snapshot.data!['match'] as Map<String, dynamic>;
            final homeComposition = snapshot.data!['home_composition'] as List<dynamic>;
            final awayComposition = snapshot.data!['away_composition'] as List<dynamic>;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Affichez les détails du match ici en utilisant matchDetails
                Text('Nom de l\'équipe domicile: ${matchDetails['team_home']['name']}'),
                Text('Nom de l\'équipe extérieure: ${matchDetails['team_away']['name']}'),

                // Affichez la composition de l'équipe à domicile
                const Text('Composition de l\'équipe à domicile:'),
                for (var player in homeComposition) ...[
                  Text('Nom: ${player['name']}, Position: ${player['position']}'),
                ],

                // Affichez la composition de l'équipe à l'extérieur
                const Text('Composition de l\'équipe à l\'extérieur:'),
                for (var player in awayComposition) ...[
                  Text('Nom: ${player['name']}, Position: ${player['position']}'),
                ],
              ],
            );
          }
        },
      ),
    );
  }
}
