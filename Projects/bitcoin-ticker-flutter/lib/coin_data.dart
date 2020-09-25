import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = "https://rest.coinapi.io/v1/exchangerate";
const apiKey = "";

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<int> getCoinData(String baseCurrency, String quote) async {
    try {
      var response =
          await http.get('$baseUrl/$baseCurrency/$quote?apikey=$apiKey');

      double exchangeRateInDouble = jsonDecode(response.body)["rate"];
      return exchangeRateInDouble.toInt();
    } catch (e) {
      print("Error");
      return 0;
    }
  }
}
