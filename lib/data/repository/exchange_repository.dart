import 'package:exchange/data/model/exchange.dart';

abstract interface class ExchangeRepository {
  Future<Exchange> getInfo(String query);
}
