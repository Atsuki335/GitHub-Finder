import 'dart:convert';
import 'package:http/http.dart' as http;

class GithubRepository {
  final clientID = 'e27cae732eb155ec328f';
  final clientSecret = '48404697e719f5be47b6f66a4dd7d5f3aef3d30d';
  final token =
      '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';

  Future<List<Map<String, dynamic>>> searchRepositories(String query) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/search/repositories?q=$query'),
      headers: {
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(body['items']);
    } else {
      throw Exception('Failed to search repositories');
    }
  }
}
