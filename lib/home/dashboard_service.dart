import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:admin_securechat/configurations/config.dart';

class DashboardService {
  static Future<int> getTotalUsers() async {
    final String apiUrl = noofusers;
    print('API URL: $apiUrl');
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final int totalUsers = responseData['totalUsers'];
        print('Total Users: $totalUsers');
        return totalUsers;
      } else {
        throw Exception(
            'Failed to fetch total users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('API Error: $e');
      throw Exception('Failed to fetch total users: $e');
    }
  }


  static Future<int> getTotalReports() async {
    final String apiUrl = noofreports;
    print('API URL: $apiUrl');
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print('Response Body: ${response.body}'); // Log the response body
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final int? totalReports = responseData['totalIssues']; // Access the correct key 'totalIssues'
        if (totalReports != null) {
          print('Total Reports: $totalReports');
          return totalReports;
        } else {
          throw Exception('Total Reports is null');
        }
      } else {
        throw Exception('Failed to fetch total reports. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('API Error: $e');
      throw Exception('Failed to fetch total reports: $e');
    }
  }}