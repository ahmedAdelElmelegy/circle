import 'package:equatable/equatable.dart';

import 'detail.dart';
import 'user.dart';

class Data extends Equatable {
  final int? id;
  final int? userId;
  final User? user;
  final dynamic driverCancelReason;
  final String? address;
  final dynamic addressDetails;
  final double? latitude;
  final double? longitude;
  final String? status;
  final bool? isCollected;
  final String? payType;
  final bool? isPaid;
  final bool? isPoints;
  final int? pointsCount;
  final int? pointsValue;
  final int? driverId;
  final dynamic driver;
  final int? driverCost;
  final int? netTotal;
  final double? taxValue;
  final int? deliveryPrice;
  final double? grandTotal;
  final dynamic notes;
  final String? createdAt;
  final String? date;
  final String? time;
  final List<StoreOrderDetail>? details;

  const Data({
    this.id,
    this.userId,
    this.user,
    this.driverCancelReason,
    this.address,
    this.addressDetails,
    this.latitude,
    this.longitude,
    this.status,
    this.isCollected,
    this.payType,
    this.isPaid,
    this.isPoints,
    this.pointsCount,
    this.pointsValue,
    this.driverId,
    this.driver,
    this.driverCost,
    this.netTotal,
    this.taxValue,
    this.deliveryPrice,
    this.grandTotal,
    this.notes,
    this.createdAt,
    this.date,
    this.time,
    this.details,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        driverCancelReason: json['driver_cancel_reason'] as dynamic,
        address: json['address'] as String?,
        addressDetails: json['address_details'] as dynamic,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        status: json['status'] as String?,
        isCollected: json['is_collected'] as bool?,
        payType: json['pay_type'] as String?,
        isPaid: json['is_paid'] as bool?,
        isPoints: json['is_points'] as bool?,
        pointsCount: json['points_count'] as int?,
        pointsValue: json['points_value'] as int?,
        driverId: json['driver_id'] as int?,
        driver: json['driver'] as dynamic,
        driverCost: json['driver_cost'] as int?,
        netTotal: json['net_total'] as int?,
        taxValue: (json['tax_value'] as num?)?.toDouble(),
        deliveryPrice: json['delivery_price'] as int?,
        grandTotal: (json['grand_total'] as num?)?.toDouble(),
        notes: json['notes'] as dynamic,
        createdAt: json['created_at'] as String?,
        date: json['date'] as String?,
        time: json['time'] as String?,
        details: (json['details'] as List<dynamic>?)
            ?.map((e) => StoreOrderDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'user': user?.toJson(),
        'driver_cancel_reason': driverCancelReason,
        'address': address,
        'address_details': addressDetails,
        'latitude': latitude,
        'longitude': longitude,
        'status': status,
        'is_collected': isCollected,
        'pay_type': payType,
        'is_paid': isPaid,
        'is_points': isPoints,
        'points_count': pointsCount,
        'points_value': pointsValue,
        'driver_id': driverId,
        'driver': driver,
        'driver_cost': driverCost,
        'net_total': netTotal,
        'tax_value': taxValue,
        'delivery_price': deliveryPrice,
        'grand_total': grandTotal,
        'notes': notes,
        'created_at': createdAt,
        'date': date,
        'time': time,
        'details': details?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      user,
      driverCancelReason,
      address,
      addressDetails,
      latitude,
      longitude,
      status,
      isCollected,
      payType,
      isPaid,
      isPoints,
      pointsCount,
      pointsValue,
      driverId,
      driver,
      driverCost,
      netTotal,
      taxValue,
      deliveryPrice,
      grandTotal,
      notes,
      createdAt,
      date,
      time,
      details,
    ];
  }
}
