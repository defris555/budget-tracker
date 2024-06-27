import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/failure_model.dart';
import '../models/transaction_model.dart';

class BudgetRepository {
  static const _baseUrl = 'https://api.notion.com/v1';
  static const _apiKey = String.fromEnvironment('NOTION_API_KEY');
  static const _databaseId = String.fromEnvironment('NOTION_DATABASE_ID');
  final http.Client _client;

  BudgetRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<Transaction>> getTransactions() async {
    try {
      const url = '$_baseUrl/databases/$_databaseId/query';
      final response = await _client.post(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $_apiKey',
          'Notion-Version': '2022-06-28',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return (data['results'] as List)
            .map((e) => Transaction.fromMap(e))
            .toList()
          ..sort((a, b) => b.date.compareTo(a.date));
      } else {
        throw const Failure(message: 'Something went wrong!');
      }
    } catch (e) {
      log('', error: 'getTransactionsError: $e');
      throw const Failure(message: 'Something went wrong!');
    }
  }
}
