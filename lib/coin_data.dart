import 'package:http/http.dart' as http;
import 'dart:convert';





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


const kApiKey = '8D8B8B07-2117-4A75-A274-5868C28196AE';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';






  class CoinData {
    Future getCoinData(String selectedCurrency) async {

      Map<String, String> cryptoPrices = {};

      //TODO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.

      for (String cr in cryptoList) {
        String requestURL = '$coinAPIURL/$cr/$selectedCurrency?apikey=$kApiKey';

        http.Response response = await http.get(Uri.parse(requestURL));
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          var lastPrice = decodedData['rate'];
          cryptoPrices[cr] = lastPrice.toStringAsFixed(0);


          //TODO 5: Return a Map of the results instead of a single value.


          return lastPrice;
        }
        else {
          print(response.statusCode);
          throw 'Problem with the get request';
        }
      }

      return cryptoPrices;


    }
  }





