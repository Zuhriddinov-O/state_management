import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import "dart:convert";

abstract class ApiService {
  Future<List<Pigeon>> getPigeons();
}

class ApiServiceImpl extends ApiService {
  @override
  Future<List<Pigeon>> getPigeons() async {
    try {
      final response = await http.get(Uri.parse("https://sebi.io/demo-image-api/pictures.json"));
      final jsonResponse = json.decode(response.body) as List;
      return jsonResponse.map((e) => Pigeon.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}

class Pigeon {
  String category;
  String path;
  String author;

  Pigeon({required this.category, required this.path, required this.author});

  Pigeon.fromJson(Map<String, dynamic> json)
      : category = json["category"],
        path = json["path"],
        author = json["author"];
}
//https://sebi.io/demo-image-api/pictures.json
