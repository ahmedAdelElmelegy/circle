import 'package:equatable/equatable.dart';

import 'payment_data.dart';

class PaymentModel extends Equatable {
  final PaymentData? data;
  final String? message;
  final int? code;

  const PaymentModel({this.data, this.message, this.code});

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        data: json['data'] == null
            ? null
            : PaymentData.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'code': code,
      };

  @override
  List<Object?> get props => [data, message, code];
}
