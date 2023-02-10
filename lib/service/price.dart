import 'dart:convert';

import 'package:bitcoin/service/api_call.dart';

class Price {
  Future<dynamic> getCryptoPriceData(
      {required String currencyName, required String cryptoName}) async {
    APICallHelper apiCallHelper =
        APICallHelper(cryptoName: cryptoName, currencyName: currencyName);
    var cryptoRate = await apiCallHelper.getRate();
    return jsonDecode(cryptoRate);
  }
}
