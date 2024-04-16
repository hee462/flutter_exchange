import 'package:exchange/data/data_source/exchange_api_impl.dart';
import 'package:exchange/data/repository/exchange_repository_impl.dart';
import 'package:exchange/presentation/exchange_veiw_model.dart';
import 'package:exchange/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ExchangeViewModel(
          repository: ExchangeRepositoryImpl(
            exchangeApi: ExchangeApiImpl(),
          ),
        ),
        child: MainScreen(),
      ),
    );
  }
}
