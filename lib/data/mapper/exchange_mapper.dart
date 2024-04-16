import 'package:exchange/data/model/exchange.dart';

import '../dto/exchange_result_dto.dart';

extension ToExchange on ExchangeResultDto {
  Exchange toExchange() {
    return Exchange(
      timeLastUpdateUnix: timeLastUpdateUnix?.toInt() ?? 0,
      timeLastUpdateUtc: timeLastUpdateUtc ?? '',
      timeNextUpdateUnix: timeNextUpdateUnix?.toInt() ?? 0,
      timeNextUpdateUtc: timeNextUpdateUtc ?? '',
      baseCode: baseCode ?? '',
      //conversionRates 있으면 as Map<String,num>
      //conversionRates null 하면 {}
      //.toJson() 하는 이유 map 형태로 담아서 데이터 사용하려고
      conversionRates: conversionRates?.toJson() as Map<String, num> ?? {},
    );
  }
}
