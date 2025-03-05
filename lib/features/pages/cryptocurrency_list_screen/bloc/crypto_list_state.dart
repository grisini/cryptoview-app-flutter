part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListState extends Equatable {}

final class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  final List<CryptoCoin> coins;

  CryptoListLoaded({required this.coins});

  @override
  List<Object?> get props => [coins];
}

class CryptoListError extends CryptoListState {
  final Object message;

  CryptoListError({required this.message});
  @override
  List<Object?> get props => [message];
}
