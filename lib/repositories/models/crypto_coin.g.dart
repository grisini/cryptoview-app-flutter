// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinAdapter extends TypeAdapter<CryptoCoin> {
  @override
  final int typeId = 2;

  @override
  CryptoCoin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoin(
      name: fields[0] as String,
      price: fields[1] as double,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoin obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoin _$CryptoCoinFromJson(Map<String, dynamic> json) => CryptoCoin(
      name: json['FROMSYMBOL'] as String? ?? '',
      price: (json['PRICE'] as num?)?.toDouble() ?? 0.0,
      image: json['IMAGEURL'] as String? ?? '',
    );

Map<String, dynamic> _$CryptoCoinToJson(CryptoCoin instance) =>
    <String, dynamic>{
      'FROMSYMBOL': instance.name,
      'PRICE': instance.price,
      'IMAGEURL': instance.image,
    };
