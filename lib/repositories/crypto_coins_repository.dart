import 'dart:collection';
import 'package:cryptoview/repositories/repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({
    required this.dio,
    required this.cryptoCoinBox,
    required this.cryptoCoinDetailBox,
  });
  final Dio dio;
  final Box<CryptoCoin> cryptoCoinBox;
  final Box<CryptoCoinDetail> cryptoCoinDetailBox;

  @override
  Future<List<CryptoCoin>> fetchCryptoCoins() async {
    var cryptoCoinList = <CryptoCoin>[];
    try {
      cryptoCoinList = await _fetchCoinsFromApi();
      // Используем LinkedHashMap, чтобы сохранить порядок вставки
      final cryptoCoinMap = LinkedHashMap<String, CryptoCoin>();
      for (var coin in cryptoCoinList) {
        cryptoCoinMap[coin.name] = coin;
      }
      cryptoCoinBox.putAll(cryptoCoinMap);
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      return cryptoCoinBox.values.toList();
    }
    return cryptoCoinList;
  }

  Future<List<CryptoCoin>> _fetchCoinsFromApi() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,PEPE,DOGE,XRP,TON,LTC&tsyms=USD',
    );
    final data = response.data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList =
        data.entries
            .map((entry) => CryptoCoin.fromJson(entry.value['USD']))
            .toList();
    return cryptoCoinList;
  }

  @override
  Future<List<CryptoCoinDetail>> fetchCryptoCoinDetails(String id) async {
    var cryptoCoinDetailList = <CryptoCoinDetail>[];
    try {
      cryptoCoinDetailList = await _fetchAboutCoinFromApi(id);
      // Сохраняем только первый элемент (если нужно сохранить весь список,
      // потребуется изменить тип ящика на Box<List<CryptoCoinDetail>>)
      cryptoCoinDetailBox.put(id, cryptoCoinDetailList.first);
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      return cryptoCoinDetailBox.values.toList();
    }
    return cryptoCoinDetailList;
  }

  Future<List<CryptoCoinDetail>> _fetchAboutCoinFromApi(String id) async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$id&tsyms=USD',
    );
    final data = response.data['RAW'] as Map<String, dynamic>;
    final cryptoCoinDetailList =
        data.entries
            .map((entry) => CryptoCoinDetail.fromJson(entry.value['USD']))
            .toList();
    return cryptoCoinDetailList;
  }
}
