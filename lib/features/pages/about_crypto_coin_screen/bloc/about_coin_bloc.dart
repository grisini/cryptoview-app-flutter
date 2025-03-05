import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cryptoview/repositories/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'about_coin_event.dart';
part 'about_coin_state.dart';

class AboutCoinBloc extends Bloc<AboutCoinEvent, AboutCoinState> {
  AboutCoinBloc(this.repository) : super(AboutCoinInitial()) {
    on<LoadAboutCoin>((event, emit) async {
      try {
        if (state is! AboutCoinLoaded) {
          emit(AboutCoinLoading());
        }
        final coin = await repository.fetchCryptoCoinDetails(event.id);
        emit(AboutCoinLoaded(coin: coin));
      } catch (e, st) {
        emit(AboutCoinError(message: e.toString()));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }
  final AbstractCoinsRepository repository;
}
