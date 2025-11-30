// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_festival_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataFestivalResponse _$DataFestivalResponseFromJson(Map<String, dynamic> json) {
  return _DataFestivalResponse.fromJson(json);
}

/// @nodoc
mixin _$DataFestivalResponse {
  @JsonKey(name: 'title')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'alamat')
  String get alamat => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking')
  int get booking => throw _privateConstructorUsedError;
  @JsonKey(name: 'ulasan')
  List<dynamic>? get ulasan => throw _privateConstructorUsedError;

  /// Serializes this DataFestivalResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataFestivalResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataFestivalResponseCopyWith<DataFestivalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataFestivalResponseCopyWith<$Res> {
  factory $DataFestivalResponseCopyWith(DataFestivalResponse value,
          $Res Function(DataFestivalResponse) then) =
      _$DataFestivalResponseCopyWithImpl<$Res, DataFestivalResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String name,
      @JsonKey(name: 'alamat') String alamat,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'booking') int booking,
      @JsonKey(name: 'ulasan') List<dynamic>? ulasan});
}

/// @nodoc
class _$DataFestivalResponseCopyWithImpl<$Res,
        $Val extends DataFestivalResponse>
    implements $DataFestivalResponseCopyWith<$Res> {
  _$DataFestivalResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataFestivalResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? alamat = null,
    Object? content = null,
    Object? booking = null,
    Object? ulasan = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      booking: null == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as int,
      ulasan: freezed == ulasan
          ? _value.ulasan
          : ulasan // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataFestivalResponseImplCopyWith<$Res>
    implements $DataFestivalResponseCopyWith<$Res> {
  factory _$$DataFestivalResponseImplCopyWith(_$DataFestivalResponseImpl value,
          $Res Function(_$DataFestivalResponseImpl) then) =
      __$$DataFestivalResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String name,
      @JsonKey(name: 'alamat') String alamat,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'booking') int booking,
      @JsonKey(name: 'ulasan') List<dynamic>? ulasan});
}

/// @nodoc
class __$$DataFestivalResponseImplCopyWithImpl<$Res>
    extends _$DataFestivalResponseCopyWithImpl<$Res, _$DataFestivalResponseImpl>
    implements _$$DataFestivalResponseImplCopyWith<$Res> {
  __$$DataFestivalResponseImplCopyWithImpl(_$DataFestivalResponseImpl _value,
      $Res Function(_$DataFestivalResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataFestivalResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? alamat = null,
    Object? content = null,
    Object? booking = null,
    Object? ulasan = freezed,
  }) {
    return _then(_$DataFestivalResponseImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      booking: null == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as int,
      ulasan: freezed == ulasan
          ? _value._ulasan
          : ulasan // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataFestivalResponseImpl implements _DataFestivalResponse {
  const _$DataFestivalResponseImpl(
      {@JsonKey(name: 'title') required this.name,
      @JsonKey(name: 'alamat') required this.alamat,
      @JsonKey(name: 'content') required this.content,
      @JsonKey(name: 'booking') required this.booking,
      @JsonKey(name: 'ulasan') required final List<dynamic>? ulasan})
      : _ulasan = ulasan;

  factory _$DataFestivalResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataFestivalResponseImplFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String name;
  @override
  @JsonKey(name: 'alamat')
  final String alamat;
  @override
  @JsonKey(name: 'content')
  final String content;
  @override
  @JsonKey(name: 'booking')
  final int booking;
  final List<dynamic>? _ulasan;
  @override
  @JsonKey(name: 'ulasan')
  List<dynamic>? get ulasan {
    final value = _ulasan;
    if (value == null) return null;
    if (_ulasan is EqualUnmodifiableListView) return _ulasan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DataFestivalResponse(name: $name, alamat: $alamat, content: $content, booking: $booking, ulasan: $ulasan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataFestivalResponseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.booking, booking) || other.booking == booking) &&
            const DeepCollectionEquality().equals(other._ulasan, _ulasan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, alamat, content, booking,
      const DeepCollectionEquality().hash(_ulasan));

  /// Create a copy of DataFestivalResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataFestivalResponseImplCopyWith<_$DataFestivalResponseImpl>
      get copyWith =>
          __$$DataFestivalResponseImplCopyWithImpl<_$DataFestivalResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataFestivalResponseImplToJson(
      this,
    );
  }
}

abstract class _DataFestivalResponse implements DataFestivalResponse {
  const factory _DataFestivalResponse(
          {@JsonKey(name: 'title') required final String name,
          @JsonKey(name: 'alamat') required final String alamat,
          @JsonKey(name: 'content') required final String content,
          @JsonKey(name: 'booking') required final int booking,
          @JsonKey(name: 'ulasan') required final List<dynamic>? ulasan}) =
      _$DataFestivalResponseImpl;

  factory _DataFestivalResponse.fromJson(Map<String, dynamic> json) =
      _$DataFestivalResponseImpl.fromJson;

  @override
  @JsonKey(name: 'title')
  String get name;
  @override
  @JsonKey(name: 'alamat')
  String get alamat;
  @override
  @JsonKey(name: 'content')
  String get content;
  @override
  @JsonKey(name: 'booking')
  int get booking;
  @override
  @JsonKey(name: 'ulasan')
  List<dynamic>? get ulasan;

  /// Create a copy of DataFestivalResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataFestivalResponseImplCopyWith<_$DataFestivalResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
