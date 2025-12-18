import 'package:equatable/equatable.dart';

class Productdetails extends Equatable {
  final int? productId;
  final int? qty;
  final int? netCost;

  const Productdetails({this.productId, this.qty, this.netCost});

  factory Productdetails.fromJson(Map<String, dynamic> json) => Productdetails(
        productId: json['product_id'] as int?,
        qty: json['qty'] as int?,
        netCost: json['net_cost'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'qty': qty,
        'net_cost': netCost,
      };

  @override
  List<Object?> get props => [productId, qty, netCost];
}
