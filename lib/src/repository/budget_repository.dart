import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/failure_model.dart';
import '../models/transaction_model.dart';
import '../utils/constants.dart';

class BudgetRepository {
  static const _apiKey = String.fromEnvironment('NOTION_API_KEY');
  static const _databaseId = String.fromEnvironment('NOTION_DATABASE_ID');
  final http.Client _client;

  BudgetRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<http.Response> requestNotion([Map<String, dynamic>? body]) async {
    const url = '$baseUrl/databases/$_databaseId/query';
    try {
      return await _client.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $_apiKey',
          'Notion-Version': '2022-06-28',
        },
      );
    } catch (e) {
      log('', error: 'requestNotionError: $e');
      throw const Failure(message: 'Something went wrong!');
    }
  }

  Future<List<Transaction>> getTransactions() async {
    try {
      final response = await requestNotion();
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List)
            .map((e) => Transaction.fromMap(e))
            .toList()
          ..sort((a, b) => b.date.compareTo(a.date));
      } else {
        throw Failure(message: 'Error: StatusCode ${response.statusCode}');
      }
    } catch (e) {
      log('', error: 'getTransactionsError: $e');
      throw const Failure(message: 'Something went wrong!');
    }
  }
}
