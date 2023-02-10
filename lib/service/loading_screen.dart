import 'package:bitcoin/price_screen.dart';
import 'package:bitcoin/service/price.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCryptoPriceData();
  }

  void getCryptoPriceData() async {
    Price price = Price();
    var btc = await price.getCryptoPriceData(cryptoName: 'BTC', currencyName: 'USD');
    var eth = await price.getCryptoPriceData(cryptoName: 'ETH', currencyName: 'USD');
    var nok = await price.getCryptoPriceData(cryptoName: 'LTC', currencyName: 'USD');

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PriceScreen(
        value: [btc, eth, nok]
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
