import 'dart:async';
import 'package:cryptoview/crypto_app.dart';
import 'package:cryptoview/repositories/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  // Делаем ошибки зоны фатальными, чтобы их легче обнаружить (опционально)
  BindingBase.debugZoneErrorsAreFatal = true;

  runZonedGuarded(
    () async {
      // Инициализируем биндинги во внутри той же зоны
      WidgetsFlutterBinding.ensureInitialized();

      // Инициализация Talker
      final talker = TalkerFlutter.init();
      GetIt.I.registerSingleton(talker);
      GetIt.I<Talker>().debug('main.dart', 'main()');

      const boxcoinsname = 'cryptoview_box';
      const boxaboutcoinname = 'crypto_coin_detail_box';

      // Инициализация Hive
      await Hive.initFlutter();
      Hive.registerAdapter(CryptoCoinAdapter());
      Hive.registerAdapter(CryptoCoinDetailAdapter());
      final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(boxcoinsname);
      final cryptoCoinDetailBox = await Hive.openBox<CryptoCoinDetail>(
        boxaboutcoinname,
      );

      // Инициализация Dio с логирующим перехватчиком
      final dio = Dio();
      dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(printResponseData: false),
        ),
      );

      // Установка наблюдателя Bloc
      Bloc.observer = TalkerBlocObserver(talker: talker);

      // Регистрация репозитория в GetIt
      GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
        () => CryptoCoinsRepository(
          dio: dio,
          cryptoCoinBox: cryptoCoinsBox,
          cryptoCoinDetailBox: cryptoCoinDetailBox,
        ),
      );

      // Обработка ошибок Flutter
      FlutterError.onError = (details) {
        GetIt.I<Talker>().handle(details.exception, details.stack);
      };

      // Запуск приложения
      runApp(const CryptoApp());
    },
    (error, stackTrace) {
      // Обработка неотловленных ошибок
      GetIt.I<Talker>().handle(error, stackTrace);
    },
  );
}
