import 'package:equatable/equatable.dart';

import 'detail.dart';
import 'user_order.dart';

class OrderData extends Equatable {
  final num? id;
  final num? userId;
  final UserOrder? user;
  final dynamic driverCancelReason;
  final String? address;
  final dynamic addressDetails;
  final num? latitude;
  final num? longitude;
  final String? status;
  final bool? isCollected;
  final String? payType;
  final bool? isPaid;
  final bool? isPoints;
  final num? pointsCount;
  final num? pointsValue;
  final num? driverId;
  final dynamic driver;
  final num? driverCost;
  final num? netTotal;
  final num? taxValue;
  final num? deliveryPrice;
  final num? grandTotal;
  final dynamic notes;
  final String? createdAt;
  final String? date;
  final String? time;
  final List<OrderDetail>? details;

  const OrderData({
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

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json['id'] as num?,
        userId: json['user_id'] as num?,
        user: json['user'] == null
            ? null
            : UserOrder.fromJson(json['user'] as Map<String, dynamic>),
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
        pointsCount: json['points_count'] as num?,
        pointsValue: json['points_value'] as num?,
        driverId: json['driver_id'] as num?,
        driver: json['driver'] as dynamic,
        driverCost: json['driver_cost'] as num?,
        netTotal: json['net_total'] as num?,
        taxValue: json['tax_value'] as num?,
        deliveryPrice: json['delivery_price'] as num?,
        grandTotal: json['grand_total'] as num?,
        notes: json['notes'] as dynamic,
        createdAt: json['created_at'] as String?,
        date: json['date'] as String?,
        time: json['time'] as String?,
        details: (json['details'] as List<dynamic>?)
            ?.map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
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
