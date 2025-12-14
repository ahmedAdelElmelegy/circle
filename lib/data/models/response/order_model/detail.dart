import 'package:equatable/equatable.dart';

import 'product.dart';

class OrderDetail extends Equatable {
  final num? id;
  final num? productId;
  final Product? product;
  final num? qty;
  final num? netCost;
  final num? total;

  const OrderDetail({
    this.id,
    this.productId,
    this.product,
    this.qty,
    this.netCost,
    this.total,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json['id'] as num?,
        productId: json['product_id'] as num?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        qty: json['qty'] as num?,
        netCost: json['net_cost'] as num?,
        total: json['total'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'product': product?.toJson(),
        'qty': qty,
        'net_cost': netCost,
        'total': total,
      };

  @override
  List<Object?> get props {
    return [
      id,
      productId,
      product,
      qty,
      netCost,
      total,
    ];
  }
}
