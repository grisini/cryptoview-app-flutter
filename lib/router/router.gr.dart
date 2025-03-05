// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AboutCryptoCoinScreen]
class AboutCryptoCoinRoute extends PageRouteInfo<AboutCryptoCoinRouteArgs> {
  AboutCryptoCoinRoute({
    Key? key,
    required CryptoCoin coin,
    List<PageRouteInfo>? children,
  }) : super(
          AboutCryptoCoinRoute.name,
          args: AboutCryptoCoinRouteArgs(
            key: key,
            coin: coin,
          ),
          initialChildren: children,
        );

  static const String name = 'AboutCryptoCoinRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AboutCryptoCoinRouteArgs>();
      return AboutCryptoCoinScreen(
        key: args.key,
        coin: args.coin,
      );
    },
  );
}

class AboutCryptoCoinRouteArgs {
  const AboutCryptoCoinRouteArgs({
    this.key,
    required this.coin,
  });

  final Key? key;

  final CryptoCoin coin;

  @override
  String toString() {
    return 'AboutCryptoCoinRouteArgs{key: $key, coin: $coin}';
  }
}

/// generated route for
/// [CryptoCurrencyListScreen]
class CryptoCurrencyListRoute extends PageRouteInfo<void> {
  const CryptoCurrencyListRoute({List<PageRouteInfo>? children})
      : super(
          CryptoCurrencyListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoCurrencyListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CryptoCurrencyListScreen();
    },
  );
}
