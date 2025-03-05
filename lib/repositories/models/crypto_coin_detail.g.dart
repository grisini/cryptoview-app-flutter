// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailAdapter extends TypeAdapter<CryptoCoinDetail> {
  @override
  final int typeId = 1;

  @override
  CryptoCoinDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetail(
      price: fields[0] as double,
      name: fields[1] as String,
      high24h: fields[2] as double,
      low24h: fields[3] as double,
      change24h: fields[4] as double,
      change1h: fields[5] as double,
      imageurl: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetail obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.high24h)
      ..writeByte(3)
      ..write(obj.low24h)
      ..writeByte(4)
      ..write(obj.change24h)
      ..writeByte(5)
      ..write(obj.change1h)
      ..writeByte(6)
      ..write(obj.imageurl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetail _$CryptoCoinDetailFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetail(
      price: (json['PRICE'] as num?)?.toDouble() ?? 0.0,
      name: json['FROMSYMBOL'] as String? ?? '',
      high24h: (json['HIGH24HOUR'] as num?)?.toDouble() ?? 0.0,
      low24h: (json['LOW24HOUR'] as num?)?.toDouble() ?? 0.0,
      change24h: (json['CHANGE24HOUR'] as num?)?.toDouble() ?? 0.0,
      change1h: (json['CHANGE1HOUR'] as num?)?.toDouble() ?? 0.0,
      imageurl: json['IMAGEURL'] as String? ?? '',
    );

Map<String, dynamic> _$CryptoCoinDetailToJson(CryptoCoinDetail instance) =>
    <String, dynamic>{
      'PRICE': instance.price,
      'FROMSYMBOL': instance.name,
      'HIGH24HOUR': instance.high24h,
      'LOW24HOUR': instance.low24h,
      'CHANGE24HOUR': instance.change24h,
      'CHANGE1HOUR': instance.change1h,
      'IMAGEURL': instance.imageurl,
    };
