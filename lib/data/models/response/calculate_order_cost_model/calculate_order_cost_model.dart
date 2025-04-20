import 'package:equatable/equatable.dart';

import 'calculate_order_data.dart';

class CalculateOrderCostModel extends Equatable {
  final CalculateOrderData? data;
  final String? message;
  final int? code;

  const CalculateOrderCostModel({this.data, this.message, this.code});

  factory CalculateOrderCostModel.fromJson(Map<String, dynamic> json) {
    return CalculateOrderCostModel(
      data: json['data'] == null
          ? null
          : CalculateOrderData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'code': code,
      };

  @override
  List<Object?> get props => [data, message, code];
}
