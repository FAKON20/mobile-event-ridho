// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_festival_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataFestivalResponseImpl _$$DataFestivalResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DataFestivalResponseImpl(
      name: json['title'] as String,
      alamat: json['alamat'] as String,
      content: json['content'] as String,
      booking: (json['booking'] as num).toInt(),
      ulasan: json['ulasan'] as List<dynamic>?,
    );

Map<String, dynamic> _$$DataFestivalResponseImplToJson(
        _$DataFestivalResponseImpl instance) =>
    <String, dynamic>{
      'title': instance.name,
      'alamat': instance.alamat,
      'content': instance.content,
      'booking': instance.booking,
      'ulasan': instance.ulasan,
    };
