
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_parameters.freezed.dart';
part 'users_parameters.g.dart';

@freezed
class UsersResponse with _$UsersResponse {
  const factory UsersResponse({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'notelp') required String notelp,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
    @JsonKey(name: 'role') required String role,
    @JsonKey(name: 'bookFest') required List bookFest,
  }) = _UsersResponse;

  factory UsersResponse.fromJson(Map<String, dynamic> json) => _$UsersResponseFromJson(json);
}

// class UsersParam extends Equatable {
//   const UsersParam({
//     required this.name,
//     required this.noTelp,
//     required this.email,
//     required this.password,
//     required this.role,
//   });
//   final String name;
//   final String noTelp;
//   final String email;
//   final String password;
//   final String role;
//
//   @override
//   List<Object?> get props => [name,noTelp,email,password,role];
// }