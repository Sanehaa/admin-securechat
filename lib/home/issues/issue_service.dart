import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:admin_securechat/configurations/config.dart';

class IssueService {
  static Future<List<Map<String, dynamic>>> getIssueData() async {
    final String apiUrl = issue;
    print('API URL: $apiUrl');
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['issues'];
        final List<Map<String, dynamic>> issueData = data.map((issue) {
          return {
            'userEmail': issue['userEmail'] as String,
            'description': issue['description'] as String,
            'timestamp': issue['timestamp'] as String,
            'screenshotUrl': issue['screenshotUrl'] as String,
          };
        }).toList();
        return issueData;
      } else {
        throw Exception('Failed to load issue data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('API Error: $e'); // Print API errors
      throw Exception('Failed to load issue data: $e');
    }
  }
}
