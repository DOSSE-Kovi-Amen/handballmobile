import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cahb/models/competition_model.dart';
import 'package:cahb/pages/competition_details.dart';
import 'package:cahb/services/api_service.dart';

import '../utils/myfunctions.dart';

class CompetionScreen extends StatefulWidget {
  const CompetionScreen({super.key});

  @override
  State<CompetionScreen> createState() => _CompetionScreenState();
}

class _CompetionScreenState extends State<CompetionScreen> {
  late Future<List<Competition>> competitionsData;

  @override
  void initState() {
    super.initState();
    competitionsData = ApiService().fetchCompetitions();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Competition>>(
      future: competitionsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        
        } else if (snapshot.hasError) {
          print('njh ${snapshot.data}');
          return const Center(child: Text('Erreur de connexion internet ou aucune compétition!'));
        } else {
          return Container(
            color: Colors.grey[100], // Couleur du fond du container
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final competition = snapshot.data![index];
                return Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: CachedNetworkImage(
                          imageUrl:
                              '${ApiService.baseUrl}/storage/${competition.competitionName?.logo}',
                          width: 45,
                          height: 45,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(), // Affichez un indicateur de chargement pendant le téléchargement de l'image
                          errorWidget: (context, url, error) => const Icon(Icons
                              .error), // Affichez un widget d'erreur si le téléchargement de l'image échoue
                        ),
                        title: Text(competition.competitionName!.name,
                            style: const TextStyle(fontSize: 14)),
                        subtitle: Text(
                            'Du ${formatDate(competition.startDate)} au ${formatDate(competition.endDate)}',
                            style: const TextStyle(fontSize: 12)),
                        trailing: Text(
                          competition.status == 'current'
                              ? 'En cours '
                              : 'A venir',
                          style: TextStyle(
                              color: competition.status == 'current'
                                  ? Colors.green
                                  : Colors.amber),
                        ),
                        tileColor: Colors.red,
                        // call to action
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CompetitionDetailDialog(
                                  competition: competition);
                            },
                          );
                        },
                      ),
                    ),
                    const Divider(
                      height: 1, // épaisseur de la ligne
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
