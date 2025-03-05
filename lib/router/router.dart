import 'package:cryptoview/features/pages.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cryptoview/repositories/repository.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CryptoCurrencyListRoute.page, initial: true, path: '/'),
    AutoRoute(page: AboutCryptoCoinRoute.page),
  ];
}

// final routes = {
//   '/': (context) => const CryptoCurrencyListScreen(),
//   '/aboutCryptoCoinScreen': (context) => const AboutCryptoCoinScreen(),
// };
