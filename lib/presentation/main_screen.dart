import 'package:exchange/data/exchange_enum.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('환율계산기'),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Row(
                children: [
                  SizedBox(
                    width: 190,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '금액을 적어주세요',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: DropdownButtonFormField(
                      items: getAreas()
                          .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(
                              value: e.value,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                      onChanged: (e) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Row(
                children: [
                  SizedBox(
                    width: 190,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '금액을 적어주세요',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: DropdownButtonFormField(
                      items: getAreas()
                          .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(
                              value: e.value,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                      onChanged: (e) {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<AreaSymbol> getAreas() {
    List<AreaSymbol> areaName = [];
    for (AreaSymbol symbol in AreaSymbol.values) {
      areaName.add(symbol);
    }
    return areaName;
  }
}
