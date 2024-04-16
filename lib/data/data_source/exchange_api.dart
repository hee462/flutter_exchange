import 'package:exchange/data/dto/exchange_result_dto.dart';

abstract interface class ExchangeApi {
  Future<ExchangeResultDto> getResult(String query);
}
