import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/roadmap_model.dart';

class RoadmapRepository {
  final String baseUrl = "https://twenty-ducks-smell.loca.lt"; 

  Future<List<RoadmapTask>> fetchRoadmap(String field, String experience) async {
    final response = await http.post(
      Uri.parse("$baseUrl/generate-roadmap"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "field": field,
        "experience": experience,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> roadmapList = data['roadmap'];
      return roadmapList.map((task) => RoadmapTask.fromJson(task)).toList();
    } else {
      throw Exception("Failed to load roadmap");
    }
  }
}