import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String? token;

  const Auth({this.token});

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };

  @override
  List<Object?> get props => [token];
}
