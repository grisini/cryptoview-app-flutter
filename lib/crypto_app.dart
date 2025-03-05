import 'package:flutter/material.dart';
import 'package:cryptoview/theme/theme.dart';
import 'package:cryptoview/router/router.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoApp extends StatefulWidget {
  const CryptoApp({super.key});

  @override
  State<CryptoApp> createState() => _CryptoAppState();
}

class _CryptoAppState extends State<CryptoApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(); // Создаем маршрутизатор заранее

    return MaterialApp.router(
      theme: DarkTheme,
      routerConfig: appRouter.config(
        navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
      ),
    );
  }
}
