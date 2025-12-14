import 'package:equatable/equatable.dart';

class UserOrder extends Equatable {
  final UserOrder? user;

  const UserOrder({this.user});

  factory UserOrder.fromJson(Map<String, dynamic> json) => UserOrder(
        user: json['user'] == null
            ? null
            : UserOrder.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [user];
}
