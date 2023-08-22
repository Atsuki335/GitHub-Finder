import 'package:http/http.dart' as http;
import 'dart:convert';
import 'item.dart';

Future<List<Items>> fetchRepositories(String query) async {
  final response = await http
      .get(Uri.parse('https://api.github.com/search/repositories?q=$query'));
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> items = jsonResponse['items'];
    List<Items> repoList = items.map((data) {
      return Items.fromJson(data);
    }).toList();
    return repoList;
  } else {
    throw Exception('Failed to load repositories');
  }
}
