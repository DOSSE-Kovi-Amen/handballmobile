import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cahb/models/about_model.dart';
import 'package:cahb/services/api_service.dart';


class AboutScreen extends StatefulWidget {
    const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late Future<About> aboutData;

  @override
  void initState() {
    super.initState();
    aboutData = ApiService().fetchAbout();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<About>(
        future: aboutData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erreur de connexion internet'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Html(data: snapshot.data!.description),
              ),
            );
          }
        },
    );
  }
}
