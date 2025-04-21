import 'package:equatable/equatable.dart';

import 'product_details.dart';

class CalculateOrderCost extends Equatable {
  final double? latitude;
  final double? longitude;
  final List<Productdetails>? details;

  const CalculateOrderCost({this.latitude, this.longitude, this.details});

  factory CalculateOrderCost.fromJson(Map<String, dynamic> json) {
    return CalculateOrderCost(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => Productdetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'details': details?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [latitude, longitude, details];
}
