import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin.g.dart'; // Для сгенерированного кода

@HiveType(typeId: 2)
@JsonSerializable()
class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.price,
    required this.image,
  });

  @HiveField(0)
  @JsonKey(name: 'FROMSYMBOL', defaultValue: '')
  final String name;

  @HiveField(1)
  @JsonKey(name: 'PRICE', defaultValue: 0.0)
  final double price;

  @HiveField(2)
  @JsonKey(name: 'IMAGEURL', defaultValue: '')
  final String image;

  factory CryptoCoin.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinToJson(this);

  @override
  List<Object?> get props => [name, price, image];
}
