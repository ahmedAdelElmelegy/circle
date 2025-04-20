import 'package:equatable/equatable.dart';

class PaymentData extends Equatable {
  final String? redirectUrl;
  final String? paymentSuccess;
  final String? paymentaFiled;

  const PaymentData(
      {this.redirectUrl, this.paymentSuccess, this.paymentaFiled});

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        redirectUrl: json['redirectUrl'] as String?,
        paymentSuccess: json['paymentSuccess'] as String?,
        paymentaFiled: json['paymentaFiled'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'redirectUrl': redirectUrl,
        'paymentSuccess': paymentSuccess,
        'paymentaFiled': paymentaFiled,
      };

  @override
  List<Object?> get props => [redirectUrl, paymentSuccess, paymentaFiled];
}
