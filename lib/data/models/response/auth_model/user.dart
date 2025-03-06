import 'package:equatable/equatable.dart';

import 'city.dart';

class UserData extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phoneCode;
  final String? phone;
  final String? image;
  final int? points;
  final String? invitationCode;
  final int? cityId;
  final City? city;

  const UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneCode,
    this.phone,
    this.image,
    this.points,
    this.invitationCode,
    this.cityId,
    this.city,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json['id'] as int?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        phoneCode: json['phone_code'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
        points: json['points'] as int?,
        invitationCode: json['invitation_code'] as String?,
        cityId: json['city_id'] as int?,
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'phone_code': phoneCode,
        'phone': phone,
        'image': image,
        'points': points,
        'invitation_code': invitationCode,
        'city_id': cityId,
        'city': city?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      phoneCode,
      phone,
      image,
      points,
      invitationCode,
      cityId,
      city,
    ];
  }
}
