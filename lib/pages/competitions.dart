import 'package:flutter/material.dart';

class CompetionScreen extends StatefulWidget {
  const CompetionScreen({super.key});

  @override
  State<CompetionScreen> createState() => _CompetionScreenState();
}

class _CompetionScreenState extends State<CompetionScreen> {
  @override
  Widget build(BuildContext context) {
   return Center(
      child: Text('Écran Trophée'),
    );
  }
}