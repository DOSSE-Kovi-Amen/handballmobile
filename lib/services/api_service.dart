import 'dart:convert';
import 'package:hanballmobile/models/about_model.dart';
import 'package:hanballmobile/models/privacy_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.1.67:8000/api'; // Mettez votre adresse IP et port ici

  Future<About> fetchAbout() async {
    final response = await http.get(Uri.parse('$baseUrl/about'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return About.fromJson(data);
    } else {
      throw Exception('Échec de la récupération des données de l\'API à propos');
    }
  }

    Future<Privacy> fetchPrivacy() async {
    final response = await http.get(Uri.parse('$baseUrl/privacy'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Privacy.fromJson(data);
    } else {
      throw Exception('Échec de la récupération des données de l\'API politique de confidentialité');
    }
  }
}
