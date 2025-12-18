import 'package:equatable/equatable.dart';

import 'product.dart';

class StoreOrderDetail extends Equatable {
  final num? id;
  final num? productId;
  final Product? product;
  final num? qty;
  final num? netCost;
  final num? total;

  const StoreOrderDetail({
    this.id,
    this.productId,
    this.product,
    this.qty,
    this.netCost,
    this.total,
  });

  factory StoreOrderDetail.fromJson(Map<String, dynamic> json) =>
      StoreOrderDetail(
        id: json['id'] as int?,
        productId: json['product_id'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        qty: (json['qty'] as num?)?.toDouble(),
        netCost: json['net_cost'] as int?,
        total: (json['total'] as num?)?.toDouble(),
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
