import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin_detail.g.dart'; // Для сгенерированного кода

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail({
    required this.price,
    required this.name,
    required this.high24h,
    required this.low24h,
    required this.change24h,
    required this.change1h,
    required this.imageurl,
  });

  @HiveField(0)
  @JsonKey(name: 'PRICE', defaultValue: 0.0)
  final double price;

  @HiveField(1)
  @JsonKey(name: 'FROMSYMBOL', defaultValue: '')
  final String name;

  @HiveField(2)
  @JsonKey(name: 'HIGH24HOUR', defaultValue: 0.0)
  final double high24h;

  @HiveField(3)
  @JsonKey(name: 'LOW24HOUR', defaultValue: 0.0)
  final double low24h;

  @HiveField(4)
  @JsonKey(name: 'CHANGE24HOUR', defaultValue: 0.0)
  final double change24h;

  @HiveField(5)
  @JsonKey(name: 'CHANGE1HOUR', defaultValue: 0.0)
  final double change1h;

  @HiveField(6)
  @JsonKey(name: 'IMAGEURL', defaultValue: '')
  final String imageurl;

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  @override
  List<Object?> get props => [
    price,
    name,
    high24h,
    low24h,
    change24h,
    change1h,
    imageurl,
  ];
}
