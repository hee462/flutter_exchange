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
  final _textEditingUserController = TextEditingController();
  final _textEditingCulController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ExchangeViewModel>().getExchange();
    });
  }
  // @override
  // void didChangeDependencies() async {
  //   await context.read<ExchangeViewModel>().getExchange();
  //   super.didChangeDependencies();
  // }

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
                      onChanged: (e) {
                        if (inputText(e) == null) {
                          viewModel.userCalculateExchange(double.parse(e));
                          _textEditingCulController.text =
                              ((viewModel.culExchangeValue * 100).round() / 100)
                                  .toString();
                        }
                      },
                      controller: _textEditingUserController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '금액을 적어주세요',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: DropdownButtonFormField<AreaSymbol>(
                      value: viewModel.userDropButton,
                      items: getAreas()
                          .map<DropdownMenuItem<AreaSymbol>>(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        viewModel.getExchange(symbol: value);
                        _textEditingUserController.text = '0';
                        _textEditingCulController.text = '0';
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
                      onChanged: (e) {
                        if (inputText(e) == null) {
                          viewModel.calculateExchange(double.parse(e));
                          _textEditingUserController.text =
                              ((viewModel.userExchangeValue * 100).round() /
                                      100)
                                  .toString();
                        }
                      },
                      controller: _textEditingCulController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '금액을 적어주세요',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: DropdownButtonFormField<AreaSymbol>(
                      value: viewModel.culDropButton,
                      items: getAreas()
                          .map<DropdownMenuItem<AreaSymbol>>(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                      onChanged: (e) {
                        viewModel.culExchange(e);
                        _textEditingUserController.text = '0';
                        _textEditingCulController.text = '0';
                      },
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

  Widget? inputText(String e) {
    if (int.tryParse(e) == null && double.tryParse(e) == null) {
      return AlertDialog(
        title: const Text('입력 오류'),
        content: const Text('숫자만 입력하세요.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('확인'),
          ),
        ],
      );
    }
    return null;
  }

  List<AreaSymbol> getAreas() {
    List<AreaSymbol> areaName = [];
    for (AreaSymbol symbol in AreaSymbol.values) {
      areaName.add(symbol);
    }
    return areaName;
  }
}
