import 'package:cryptoview/repositories/repository.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> fetchCryptoCoins();
  Future<List<CryptoCoinDetail>> fetchCryptoCoinDetails(String id);
}
