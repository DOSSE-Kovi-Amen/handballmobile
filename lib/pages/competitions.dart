import 'package:flutter/material.dart';
import 'package:hanballmobile/models/competition_model.dart';
import 'package:hanballmobile/services/api_service.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Compétitions'),
      ),
      body: FutureBuilder<List<Competition>>(
        future: competitionsData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final competition = snapshot.data![index];
                return ListTile(
                  leading: Image.network('${ApiService.baseUrl}/${competition.logo}'),
                  title: Text(competition.name),
                  subtitle: Text('Du ${competition.startDate} au ${competition.endDate}'),
                  trailing: Text(competition.status),
                );
              },
            );
          }
        },
      ),
    );
  }
}