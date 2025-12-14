import 'package:equatable/equatable.dart';

import 'order_data.dart';

class OrderModel extends Equatable {
  final List<OrderData>? data;
  final String? message;
  final int? code;

  const OrderModel({this.data, this.message, this.code});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => OrderData.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
        'code': code,
      };

  @override
  List<Object?> get props => [data, message, code];
}
