import 'package:equatable/equatable.dart';

class Detail extends Equatable {
	final int? productId;
	final double? qty;
	final int? netCost;

	const Detail({this.productId, this.qty, this.netCost});

	factory Detail.fromJson(Map<String, dynamic> json) => Detail(
				productId: json['product_id'] as int?,
				qty: (json['qty'] as num?)?.toDouble(),
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
