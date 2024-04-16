import 'package:exchange/data/data_source/exchange_api.dart';
import 'package:exchange/data/mapper/exchange_mapper.dart';
import 'package:exchange/data/model/exchange.dart';
import 'package:exchange/data/repository/exchange_repository.dart';

class ExchangeRepositoryImpl implements ExchangeRepository {
  final ExchangeApi _exchangeApi;

  const ExchangeRepositoryImpl({
    required ExchangeApi exchangeApi,
  }) : _exchangeApi = exchangeApi;

  @override
  Future<Exchange> getInfo(String query) async {
    final results = await _exchangeApi.getResult(query);
    return results.toExchange();
  }
}
