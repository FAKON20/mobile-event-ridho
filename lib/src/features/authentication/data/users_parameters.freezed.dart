// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) {
  return _UsersResponse.fromJson(json);
}

/// @nodoc
mixin _$UsersResponse {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'notelp')
  String get notelp => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookFest')
  List<dynamic> get bookFest => throw _privateConstructorUsedError;

  /// Serializes this UsersResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsersResponseCopyWith<UsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersResponseCopyWith<$Res> {
  factory $UsersResponseCopyWith(
          UsersResponse value, $Res Function(UsersResponse) then) =
      _$UsersResponseCopyWithImpl<$Res, UsersResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'notelp') String notelp,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password,
      @JsonKey(name: 'role') String role,
      @JsonKey(name: 'bookFest') List<dynamic> bookFest});
}

/// @nodoc
class _$UsersResponseCopyWithImpl<$Res, $Val extends UsersResponse>
    implements $UsersResponseCopyWith<$Res> {
  _$UsersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? notelp = null,
    Object? email = null,
    Object? password = null,
    Object? role = null,
    Object? bookFest = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notelp: null == notelp
          ? _value.notelp
          : notelp // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      bookFest: null == bookFest
          ? _value.bookFest
          : bookFest // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersResponseImplCopyWith<$Res>
    implements $UsersResponseCopyWith<$Res> {
  factory _$$UsersResponseImplCopyWith(
          _$UsersResponseImpl value, $Res Function(_$UsersResponseImpl) then) =
      __$$UsersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'notelp') String notelp,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password,
      @JsonKey(name: 'role') String role,
      @JsonKey(name: 'bookFest') List<dynamic> bookFest});
}

/// @nodoc
class __$$UsersResponseImplCopyWithImpl<$Res>
    extends _$UsersResponseCopyWithImpl<$Res, _$UsersResponseImpl>
    implements _$$UsersResponseImplCopyWith<$Res> {
  __$$UsersResponseImplCopyWithImpl(
      _$UsersResponseImpl _value, $Res Function(_$UsersResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? notelp = null,
    Object? email = null,
    Object? password = null,
    Object? role = null,
    Object? bookFest = null,
  }) {
    return _then(_$UsersResponseImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notelp: null == notelp
          ? _value.notelp
          : notelp // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      bookFest: null == bookFest
          ? _value._bookFest
          : bookFest // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersResponseImpl implements _UsersResponse {
  const _$UsersResponseImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'notelp') required this.notelp,
      @JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'password') required this.password,
      @JsonKey(name: 'role') required this.role,
      @JsonKey(name: 'bookFest') required final List<dynamic> bookFest})
      : _bookFest = bookFest;

  factory _$UsersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersResponseImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'notelp')
  final String notelp;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'password')
  final String password;
  @override
  @JsonKey(name: 'role')
  final String role;
  final List<dynamic> _bookFest;
  @override
  @JsonKey(name: 'bookFest')
  List<dynamic> get bookFest {
    if (_bookFest is EqualUnmodifiableListView) return _bookFest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookFest);
  }

  @override
  String toString() {
    return 'UsersResponse(name: $name, notelp: $notelp, email: $email, password: $password, role: $role, bookFest: $bookFest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersResponseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.notelp, notelp) || other.notelp == notelp) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other._bookFest, _bookFest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, notelp, email, password,
      role, const DeepCollectionEquality().hash(_bookFest));

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersResponseImplCopyWith<_$UsersResponseImpl> get copyWith =>
      __$$UsersResponseImplCopyWithImpl<_$UsersResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersResponseImplToJson(
      this,
    );
  }
}

abstract class _UsersResponse implements UsersResponse {
  const factory _UsersResponse(
          {@JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'notelp') required final String notelp,
          @JsonKey(name: 'email') required final String email,
          @JsonKey(name: 'password') required final String password,
          @JsonKey(name: 'role') required final String role,
          @JsonKey(name: 'bookFest') required final List<dynamic> bookFest}) =
      _$UsersResponseImpl;

  factory _UsersResponse.fromJson(Map<String, dynamic> json) =
      _$UsersResponseImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'notelp')
  String get notelp;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'password')
  String get password;
  @override
  @JsonKey(name: 'role')
  String get role;
  @override
  @JsonKey(name: 'bookFest')
  List<dynamic> get bookFest;

  /// Create a copy of UsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersResponseImplCopyWith<_$UsersResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
