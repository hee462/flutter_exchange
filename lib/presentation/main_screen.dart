import 'package:exchange/data/enum/exchange_enum.dart';
import 'package:exchange/presentation/exchange_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ExchangeViewModel>().getExchange();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExchangeViewModel>();
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
                    child: DropdownButtonFormField<String>(
                      value: viewModel.userDropButton.name,
                      items: getAreas()
                          .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(
                              value: e.value,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {});
                      },
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
                  // SizedBox(
                  //   width: 220,
                  //   child: DropdownButtonFormField(
                  //     value: 'sss',
                  //     // value: DropdownMenuItem<String>(
                  //     //     value: viewModel.culDropButton.value,
                  //     //     child: Text(viewModel.culDropButton.name)),
                  //     items: getAreas()
                  //         .map<DropdownMenuItem<String>>(
                  //           (e) => DropdownMenuItem(
                  //             value: e.value,
                  //             child: Text(e.name),
                  //           ),
                  //         )
                  //         .toList(),
                  //     onChanged: (e) {},
                  //   ),
                  // ),
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
