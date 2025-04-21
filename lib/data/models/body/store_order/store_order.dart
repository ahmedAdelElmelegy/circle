import 'package:circle/data/models/body/calculate_order_cost/product_details.dart';
import 'package:equatable/equatable.dart';

class StoreOrder extends Equatable {
  final String? address;
  final num? delivery;
  final double? latitude;
  final double? longitude;
  final dynamic notes;
  final String? payType;
  final num? netTotal;
  final num? driverCost;
  final bool? isPoints;
  final num? pointsCount;
  final num? pointsValue;
  final num? taxValue;
  final num? grandTotal;
  final List<Productdetails>? details;

  const StoreOrder({
    this.address,
    this.delivery,
    this.latitude,
    this.longitude,
    this.notes,
    this.payType,
    this.netTotal,
    this.driverCost,
    this.isPoints,
    this.pointsCount,
    this.pointsValue,
    this.taxValue,
    this.grandTotal,
    this.details,
  });

  factory StoreOrder.fromJson(Map<String, dynamic> json) => StoreOrder(
        address: json['address'] as String?,
        delivery: json['delivery'] as num?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        notes: json['notes'] as dynamic,
        payType: json['pay_type'] as String?,
        netTotal: json['net_total'] as num?,
        driverCost: json['driver_cost'] as num?,
        isPoints: json['is_points'] as bool?,
        pointsCount: json['points_count'] as num?,
        pointsValue: json['points_value'] as num?,
        taxValue: (json['tax_value'] as num?)?.toDouble(),
        grandTotal: (json['grand_total'] as num?)?.toDouble(),
        details: (json['details'] as List<dynamic>?)
            ?.map((e) => Productdetails.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'delivery': delivery,
        'latitude': latitude,
        'longitude': longitude,
        'notes': notes,
        'pay_type': payType,
        'net_total': netTotal,
        'driver_cost': driverCost,
        'is_points': isPoints,
        'points_count': pointsCount,
        'points_value': pointsValue,
        'tax_value': taxValue,
        'grand_total': grandTotal,
        'details': details?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      address,
      delivery,
      latitude,
      longitude,
      notes,
      payType,
      netTotal,
      driverCost,
      isPoints,
      pointsCount,
      pointsValue,
      taxValue,
      grandTotal,
      details,
    ];
  }
}
