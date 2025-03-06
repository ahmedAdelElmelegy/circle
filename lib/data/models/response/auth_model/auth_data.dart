import 'package:equatable/equatable.dart';

import 'auth.dart';
import 'user.dart';

class AuthData extends Equatable {
  final UserData? user;
  final Auth? auth;

  const AuthData({this.user, this.auth});

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
        user: json['user'] == null
            ? null
            : UserData.fromJson(json['user'] as Map<String, dynamic>),
        auth: json['auth'] == null
            ? null
            : Auth.fromJson(json['auth'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'auth': auth?.toJson(),
      };

  @override
  List<Object?> get props => [user, auth];
}
