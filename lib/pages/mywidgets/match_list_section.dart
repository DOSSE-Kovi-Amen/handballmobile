import 'package:flutter/material.dart';
import 'package:hanballmobile/models/match_model.dart';
import 'package:hanballmobile/pages/match_details.dart';
import 'package:hanballmobile/services/api_service.dart';
import 'package:hanballmobile/utils/myfunctions.dart';

class MatchListSection extends StatelessWidget {
  final List<Game> matches; // La liste des matchs à afficher
  final String titleSection;

  const MatchListSection(
      {super.key, required this.titleSection, required this.matches});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Ajustez ces valeurs en fonction de vos préférences
    double fontSize = screenWidth < 600 ? 14.0 : 18.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleSection,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        // const SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(), // Désactive le défilement du ListView
          itemCount: matches.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final match = matches[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MatchDetailsPage( matchId: null,),
                  ),
                );
              },
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo de l'équipe à domicile
                    Image.network(
                      '${ApiService.baseUrl}/storage/${match.teamHome.logo}',
                      width: 30,
                      height: 30,
                    ),
                    // Nom de l'équipe à domicile
                    Flexible(
                      child: Text(
                        ' ${match.teamHome.name}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                    // Score
                    Text('${match.goalsHome} - ${match.goalsAway}'),
                    // Nom de l'équipe à l'extérieur
                    Flexible(
                      child: Text(
                        ' ${match.teamAway.name}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                    // Logo de l'équipe à l'extérieur
                    Image.network(
                      '${ApiService.baseUrl}/storage/${match.teamAway.logo}',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
                subtitle: Text(
                  'Date: ${formatDate(match.date)} à  ${match.time}',
                ),
                // Ajoutez d'autres détails si nécessaire
              ),
            );
          },
        ),
      ],
    );
  }
}
