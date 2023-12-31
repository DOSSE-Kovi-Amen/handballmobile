import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hanballmobile/models/competition_model.dart';
import 'package:hanballmobile/services/api_service.dart';
import '../utils/myfunctions.dart';

class CompetitionDetailDialog extends StatelessWidget {
  final Competition competition;

  const CompetitionDetailDialog({Key? key, required this.competition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(competition.competitionName!.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network('${ApiService.baseUrl}/storage/${competition.competitionName!.logo}'),
            const SizedBox(height: 16),
            Text('Du ${formatDate(competition.startDate)} au ${formatDate(competition.endDate)}'),
            const SizedBox(height: 16),
            Text('Statut: ${competition.status == 'current' ? 'En cours' : 'A venir'}'),
            // Ajoutez d'autres détails si nécessaire
            // Html(data: competition.description)
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Fermer'),
        ),
      ],
    );
  }
}
