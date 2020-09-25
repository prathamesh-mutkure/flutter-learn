import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/components/currency_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String selectedCurrency = currenciesList[0];

  int btcRate;
  int ethRate;
  int ltcRate;

  void updateUI(String newCurrency) async {
    int newBtcRate = await coinData.getCoinData("BTC", selectedCurrency);
    int newEthRate = await coinData.getCoinData("ETH", selectedCurrency);
    int newLtcRate = await coinData.getCoinData("LTC", selectedCurrency);
    setState(() {
      selectedCurrency = newCurrency;
      btcRate = newBtcRate;
      ethRate = newEthRate;
      ltcRate = newLtcRate;
    });
  }

  Widget iosPicker() => CupertinoPicker(
        itemExtent: 32,
        onSelectedItemChanged: (selectedIndex) =>
            updateUI(currenciesList[selectedIndex]),
        children: currenciesList
            .map(
              (currency) => Text(
                currency,
                style: TextStyle(color: Colors.white),
              ),
            )
            .toList(),
      );

  Widget androidPicker() => DropdownButton<String>(
        value: selectedCurrency,
        onChanged: (value) => updateUI(value),
        items: currenciesList
            .map(
              (currency) => DropdownMenuItem(
                value: currency,
                child: Text(currency),
              ),
            )
            .toList(),
      );

  @override
  void initState() {
    super.initState();
    updateUI(selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    coinData.getCoinData("BTC", "USD");
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CurrencyCard(
            btcRate: btcRate,
            selectedCurrency: selectedCurrency,
            baseCurrencyLabel: "BTC",
          ),
          CurrencyCard(
            btcRate: ethRate,
            selectedCurrency: selectedCurrency,
            baseCurrencyLabel: "ETH",
          ),
          CurrencyCard(
            btcRate: ltcRate,
            selectedCurrency: selectedCurrency,
            baseCurrencyLabel: "LTC",
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidPicker(),
          ),
        ],
      ),
    );
  }
}
