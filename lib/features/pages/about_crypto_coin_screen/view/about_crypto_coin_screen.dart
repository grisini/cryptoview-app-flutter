import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cryptoview/features/pages/about_crypto_coin_screen/bloc/about_coin_bloc.dart';
import 'package:cryptoview/repositories/repository.dart';
import 'package:cryptoview/features/pages/about_crypto_coin_screen/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class AboutCryptoCoinScreen extends StatefulWidget {
  const AboutCryptoCoinScreen({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  State<AboutCryptoCoinScreen> createState() => _AboutCryptoCoinScreenState();
}

class _AboutCryptoCoinScreenState extends State<AboutCryptoCoinScreen> {
  late AboutCoinBloc _aboutCryptoCoinBloc;

  @override
  void initState() {
    super.initState();
    _aboutCryptoCoinBloc = AboutCoinBloc(GetIt.I<AbstractCoinsRepository>());
    // Используем данные, переданные через конструктор
    _aboutCryptoCoinBloc.add(LoadAboutCoin(id: widget.coin.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.coin.name,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocProvider(
            create: (_) => _aboutCryptoCoinBloc,
            child: BlocBuilder<AboutCoinBloc, AboutCoinState>(
              builder: (context, state) {
                if (state is AboutCoinLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AboutCoinLoaded) {
                  // Здесь предполагается, что state.coin – это List<CryptoCoinDetail>
                  return CoinInfoPage(coin: state.coin.first);
                } else if (state is AboutCoinError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    final completer = Completer();
    _aboutCryptoCoinBloc.add(
      LoadAboutCoin(id: widget.coin.name, completer: completer),
    );
    return completer.future;
  }
}
