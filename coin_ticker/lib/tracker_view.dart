import 'package:coin_ticker/cards.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'networking.dart';

class TrackerView extends StatefulWidget {
  const TrackerView({super.key});

  @override
  State<TrackerView> createState() => _TrackerViewState();
}

class _TrackerViewState extends State<TrackerView> {
  double coinValue = 0.0;
  String? selectedCurrency = 'USD';
  int listSize = currenciesList.length;

  List<DropdownMenuItem<String>>? getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (int i = 0; i < listSize; i++) {
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(value: currency, child: Text(currency));
      dropdownItems.add(newItem);
    }

    return dropdownItems;
  }

  void refreshData(currency) async {
    var coinData = await Networking().getData('USD');
    setState(() {
      coinValue = coinData['rate'];
    });
  }

  @override
  void initState() {
    refreshData(selectedCurrency);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getDropdownItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coin Ticker💲"),
        backgroundColor: Colors.teal.shade800,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CoinCard(
                  coinValue: coinValue,
                  selectedCurrency: selectedCurrency,
                  coin: 'BTC'),
              CoinCard(
                  coinValue: coinValue,
                  selectedCurrency: selectedCurrency,
                  coin: 'ETH'),
              CoinCard(
                  coinValue: coinValue,
                  selectedCurrency: selectedCurrency,
                  coin: 'LTC'),
            ],
          ),
          Container(
              height: 150,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30),
              color: Colors.teal.shade800,
              child: DropdownButton<String>(
                menuMaxHeight: 500,
                value: selectedCurrency,
                onChanged: (String? value) async {
                  var coinData = await Networking().getData(value);

                  setState(() {
                    selectedCurrency = value;
                    coinValue = coinData['rate'];
                  });
                },
                items: getDropdownItems(),
              ))
        ],
      ),
    );
  }
}
