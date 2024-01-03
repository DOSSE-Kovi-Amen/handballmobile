import 'dart:convert';
import 'package:cahb/models/about_model.dart';
import 'package:cahb/models/competition_model.dart';
import 'package:cahb/models/match_model.dart';
import 'package:cahb/models/privacy_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://cahb.frikalab-group.com'; // Mettez votre adresse IP et port ici

  Future<About> fetchAbout() async {
    final response = await http.get(Uri.parse('$baseUrl/api/about'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return About.fromJson(data);
    } else {
      throw Exception('Échec de la récupération des données de l\'API à propos');
    }
  }

    Future<Privacy> fetchPrivacy() async {
    final response = await http.get(Uri.parse('$baseUrl/api/privacy'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Privacy.fromJson(data);
    } else {
      throw Exception('Échec de la récupération des données de l\'API politique de confidentialité');
    }
  }

    Future<List<Competition>> fetchCompetitions() async {
    final response = await http.get(Uri.parse('$baseUrl/api/competitions'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print('object');
            print(data);

      return data.map((json) => Competition.fromJson(json)).toList();
    } else {
      throw Exception('Échec de la récupération des données de l\'API competition');
    }
  }

    Future<List<Game>> fetchCurrentMatches() async {
    final response = await http.get(Uri.parse('$baseUrl/api/current-matchs'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData.map((json) => Game.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load current matches');
    }
  }

  Future<List<Game>> fetchComingMatches() async {
    final response = await http.get(Uri.parse('$baseUrl/api/coming-matchs'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Game.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load coming matches');
    }
  }
  Future<List<Game>> fetchClosedMatches() async {
    final response = await http.get(Uri.parse('$baseUrl/api/closed-matchs'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Game.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load closed matches');
    }
  }

    Future<Map<String, dynamic>> fetchMatchDetails(int matchId) async {
    final response = await http.get(Uri.parse('$baseUrl/api/onematch/$matchId'));

    if (response.statusCode == 200) {
      // La requête a réussi, analysez le JSON et retournez les données
      return json.decode(response.body);
    } else {
      // La requête a échoué, lancez une exception avec le message d'erreur
      throw Exception('Erreur lors de la récupération des détails du match');
    }
  }
}
