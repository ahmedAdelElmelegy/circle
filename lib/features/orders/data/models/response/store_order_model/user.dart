import 'package:equatable/equatable.dart';


class User extends Equatable {
	final User? user;

	const User({this.user});

	factory User.fromJson(Map<String, dynamic> json) => User(
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'user': user?.toJson(),
			};

	@override
	List<Object?> get props => [user];
}
