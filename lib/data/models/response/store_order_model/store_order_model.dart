import 'package:equatable/equatable.dart';

import 'data.dart';

class StoreOrderModel extends Equatable {
	final Data? data;
	final String? message;
	final int? code;

	const StoreOrderModel({this.data, this.message, this.code});

	factory StoreOrderModel.fromJson(Map<String, dynamic> json) {
		return StoreOrderModel(
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
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
