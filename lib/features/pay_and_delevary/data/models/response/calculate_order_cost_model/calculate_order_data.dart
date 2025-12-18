import 'package:equatable/equatable.dart';

class CalculateOrderData extends Equatable {
  final num? points;
  final num? willDiscPoints;
  final num? totalPoints;
  final num? netTotal;
  final num? taxValue;
  final num? totalTax;
  final num? grandTotalWithoutDriverCost;
  final num? deliveryPrice;
  final num? grandTotal;

  const CalculateOrderData({
    this.points,
    this.willDiscPoints,
    this.totalPoints,
    this.netTotal,
    this.taxValue,
    this.totalTax,
    this.grandTotalWithoutDriverCost,
    this.deliveryPrice,
    this.grandTotal,
  });

  factory CalculateOrderData.fromJson(Map<String, dynamic> json) =>
      CalculateOrderData(
        points: json['points'] as num?,
        willDiscPoints: json['will_disc_points'] as num?,
        totalPoints: json['total_points'] as num?,
        netTotal: json['net_total'] as num?,
        taxValue: json['tax_value'] as num?,
        totalTax: json['total_tax'] as num?,
        grandTotalWithoutDriverCost:
            json['grand_total_without_driver_cost'] as num?,
        deliveryPrice: json['delivery_price'] as num?,
        grandTotal: json['grand_total'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'points': points,
        'will_disc_points': willDiscPoints,
        'total_points': totalPoints,
        'net_total': netTotal,
        'tax_value': taxValue,
        'total_tax': totalTax,
        'grand_total_without_driver_cost': grandTotalWithoutDriverCost,
        'delivery_price': deliveryPrice,
        'grand_total': grandTotal,
      };

  @override
  List<Object?> get props {
    return [
      points,
      willDiscPoints,
      totalPoints,
      netTotal,
      taxValue,
      totalTax,
      grandTotalWithoutDriverCost,
      deliveryPrice,
      grandTotal,
    ];
  }
}
