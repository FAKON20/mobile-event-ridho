import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_festival_parameters.freezed.dart';
part 'data_festival_parameters.g.dart';

@freezed
class DataFestivalResponse with _$DataFestivalResponse {
  const factory DataFestivalResponse({
    @JsonKey(name: 'title') required String name,
    @JsonKey(name: 'alamat') required String alamat,
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'booking') required int booking,
    @JsonKey(name: 'ulasan') required List? ulasan,
  }) = _DataFestivalResponse;

  factory DataFestivalResponse.fromJson(Map<String, dynamic> json) => _$DataFestivalResponseFromJson(json);
}