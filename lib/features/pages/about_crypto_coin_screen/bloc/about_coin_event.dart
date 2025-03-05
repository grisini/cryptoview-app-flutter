part of 'about_coin_bloc.dart';

sealed class AboutCoinEvent extends Equatable {
  const AboutCoinEvent();

  @override
  List<Object> get props => [];
}

class LoadAboutCoin extends AboutCoinEvent {
  final Completer? completer;
  final String id;

  const LoadAboutCoin({this.completer, required this.id});
}
