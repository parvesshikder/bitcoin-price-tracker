import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'A812ABC4-5B12-44ED-8292-C353D5DBDB28';

class APICallHelper {
  final String currencyName;
  final String cryptoName;

  APICallHelper({required this.currencyName, required this.cryptoName});

  Future<String> getRate() async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$cryptoName/$currencyName?apikey=$apiKey'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load crypto Price');
    }
  }
}
