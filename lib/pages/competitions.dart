import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hanballmobile/models/competition_model.dart';
import 'package:hanballmobile/pages/competition_details.dart';
import 'package:hanballmobile/services/api_service.dart';

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
                  print(snapshot.data);

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur : ${snapshot.error}'));
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
                        leading: Image.network(
                            '${ApiService.baseUrl}/storage/${competition.competitionName!.logo}'),
                        title: Text(competition.competitionName!.name, style: const TextStyle(fontSize: 14)),
                        subtitle: Text(
                            'Du ${formatDate(competition.startDate)} au ${formatDate(competition.endDate)}',
                            style: TextStyle(fontSize: 12)
                            ),
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
