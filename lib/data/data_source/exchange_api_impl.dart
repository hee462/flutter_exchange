//https://v6.exchangerate-api.com/v6/bcbdd3a41496f6800c7c6689/latest/USD

import 'dart:convert';

import 'package:exchange/data/data_source/exchange_api.dart';
import 'package:exchange/data/dto/exchange_result_dto.dart';
import 'package:http/http.dart' as http;

class ExchangeApiImpl implements ExchangeApi {
  final _baseUrl = "https://v6.exchangerate-api.com/v6/";
  final _api = "bcbdd3a41496f6800c7c6689";

  Future<ExchangeResultDto> getResult(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl$_api/latest/$query'));
    return ExchangeResultDto.fromJson(jsonDecode(response.body));
  }
}
