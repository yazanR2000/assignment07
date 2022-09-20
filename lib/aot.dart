import 'dart:convert';

import 'package:http/http.dart' as http;

class AOT {
  final List<Map<String, dynamic>> _characters = [];
 
  List<Map<String, dynamic>> get characters => _characters;

  Future getAOTCharacters() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api-attack-on-titan.herokuapp.com/api/v1/characters"),
      );
      print(json.decode(response.body));
      final data =json.decode(response.body) as List<dynamic>;
      data.forEach((element) {
        _characters.add(element);
      });
      //print(_characters);
    } catch (err) {
      print(err);
    }
  }
}