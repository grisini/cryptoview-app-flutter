import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cryptoview/features/pages/cryptocurrency_list_screen/widgets/widgets.dart';
import 'package:cryptoview/repositories/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cryptoview/features/pages/cryptocurrency_list_screen/bloc/crypto_list_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class CryptoCurrencyListScreen extends StatefulWidget {
  const CryptoCurrencyListScreen({super.key});

  @override
  State<CryptoCurrencyListScreen> createState() =>
      _CryptoCurrencyListScreenState();
}

class _CryptoCurrencyListScreenState extends State<CryptoCurrencyListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    super.initState();
    _cryptoListBloc.add(LoadCryptoList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coins List',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.document_scanner_rounded),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TalkerScreen(talker: GetIt.I<Talker>()),
                ),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final complitor = Completer();
          _cryptoListBloc.add(LoadCryptoList(complitor));
          return complitor.future;
        },
        child: BlocProvider(
          create: (_) => _cryptoListBloc,
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            builder: (context, state) {
              if (state is CryptoListInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CryptoListLoaded) {
                return SafeArea(
                  child: ListView.separated(
                    separatorBuilder:
                        (context, index) => const Divider(height: 10),
                    itemCount: state.coins.length,
                    itemBuilder: (context, index) {
                      final coin = state.coins[index];
                      return CryptoCoinTileWidget(cryptoCoin: coin);
                    },
                  ),
                );
              } else if (state is CryptoListError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Something went wrong',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Please try again later',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () {
                          _cryptoListBloc.add(LoadCryptoList());
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              } else if (state is CryptoListLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Center(
                  child: Text(
                    'Error loading coins',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cryptoListBloc
        .close(); // Don't forget to close the Bloc when the widget is disposed
    super.dispose();
  }
}
