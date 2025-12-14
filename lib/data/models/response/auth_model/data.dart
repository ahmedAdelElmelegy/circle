import 'package:equatable/equatable.dart';

import 'auth.dart';
import 'user.dart';

class Data extends Equatable {
  final UserData? user;
  final Auth? auth;

  const Data({this.user, this.auth});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
