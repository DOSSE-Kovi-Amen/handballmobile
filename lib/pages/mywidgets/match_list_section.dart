import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cahb/models/match_model.dart';
import 'package:cahb/pages/match_details.dart';
import 'package:cahb/services/api_service.dart';
import 'package:cahb/utils/myfunctions.dart';

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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MatchDetailsPage( matchId: 12,),
                //   ),
                // );
              },
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo de l'équipe à domicile
                    match.teamHome != null? CachedNetworkImage(
                      imageUrl:
                          '${ApiService.baseUrl}/storage/${match.teamHome?.logo}',
                      width: 45,
                      height: 45,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(), // Affichez un indicateur de chargement pendant le téléchargement de l'image
                      errorWidget: (context, url, error) => const Icon(Icons
                          .error), // Affichez un widget d'erreur si le téléchargement de l'image échoue
                    ):Container(),
                    // Nom de l'équipe à domicile
                    Flexible(
                      child: Text(
                        ' ${match.teamHome?.name}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                    // Score
                    Text('${match.goalsHome} - ${match.goalsAway}'),
                    // Nom de l'équipe à l'extérieur
                    Flexible(
                      child: Text(
                        ' ${match.teamAway?.name}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                    // Logo de l'équipe à l'extérieur
                    match.teamAway != null?CachedNetworkImage(
                      imageUrl:
                          '${ApiService.baseUrl}/storage/${match.teamAway?.logo}',
                      width: 45,
                      height: 45,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(), // Affichez un indicateur de chargement pendant le téléchargement de l'image
                      errorWidget: (context, url, error) => const Icon(Icons
                          .error), // Affichez un widget d'erreur si le téléchargement de l'image échoue
                    ):Container(),
                  ],
                ),
                subtitle: Text(
                  'Date: ${formatDate(match.date ?? "")} à  ${match.time} (${match.group?.name}) (${match.competition?.competitionName?.name})',
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
