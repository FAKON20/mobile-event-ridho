// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersResponseImpl _$$UsersResponseImplFromJson(Map<String, dynamic> json) =>
    _$UsersResponseImpl(
      name: json['name'] as String,
      notelp: json['notelp'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      bookFest: json['bookFest'] as List<dynamic>,
    );

Map<String, dynamic> _$$UsersResponseImplToJson(_$UsersResponseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'notelp': instance.notelp,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'bookFest': instance.bookFest,
    };
