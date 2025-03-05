part of 'about_coin_bloc.dart';

abstract class AboutCoinState extends Equatable {
  const AboutCoinState();

  @override
  List<Object?> get props => [];
}

class AboutCoinInitial extends AboutCoinState {}

class AboutCoinLoading extends AboutCoinState {}

class AboutCoinLoaded extends AboutCoinState {
  final List<CryptoCoinDetail> coin;

  const AboutCoinLoaded({required this.coin});

  @override
  List<Object?> get props => [coin];
}

class AboutCoinError extends AboutCoinState {
  final String message;

  const AboutCoinError({required this.message});

  @override
  List<Object?> get props => [message];
}
