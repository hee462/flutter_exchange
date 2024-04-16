import 'package:exchange/data/model/exchange.dart';
import 'package:flutter/cupertino.dart';

import '../data/enum/exchange_enum.dart';
import '../data/repository/exchange_repository.dart';

class ExchangeViewModel with ChangeNotifier {
  final ExchangeRepository _repository;
  Exchange? exchange;
  num userExchangeValue = 0;
  num culExchangeValue = 0;
  AreaSymbol userDropButton = AreaSymbol.krw;
  AreaSymbol culDropButton = AreaSymbol.usd;

  ExchangeViewModel({
    required ExchangeRepository repository,
  }) : _repository = repository;

  Future<void> getExchange(AreaSymbol? symbol) async {
    // userDropButton 에 기본값 설정
    userDropButton = symbol ?? userDropButton;
    exchange = await _repository.getInfo(userDropButton.value);
    // 안쓰는 상태에서 값 확인해보기
    notifyListeners();
  }

  Future<void> culExchange(AreaSymbol? symbol) async {
    culDropButton = symbol ?? culDropButton;
  }

  void calculateExchange(num money) {
    culExchangeValue = money;
    userExchangeValue =
        culExchangeValue * exchange!.conversionRates[culDropButton.value]!;
    notifyListeners();
  }

  void userCalculateExchange(num money) {
    userExchangeValue = money;
    culExchangeValue =
        userExchangeValue / exchange!.conversionRates[culDropButton.value]!;
    notifyListeners();
  }
}
