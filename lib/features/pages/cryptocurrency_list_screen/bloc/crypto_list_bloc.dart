import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cryptoview/repositories/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.repository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final coins = await repository.fetchCryptoCoins();
        emit(CryptoListLoaded(coins: coins));
      } catch (e, st) {
        emit(CryptoListError(message: e.toString()));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }
  final AbstractCoinsRepository repository;
}
