import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cahb/models/privacy_model.dart';
import 'package:cahb/services/api_service.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
    late Future<Privacy> privacyData;

  @override
  void initState() {
    super.initState();
    privacyData = ApiService().fetchPrivacy();
  }

  @override
Widget build(BuildContext context) {
    return FutureBuilder<Privacy>(
        future: privacyData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
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