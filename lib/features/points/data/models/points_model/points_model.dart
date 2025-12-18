import 'package:equatable/equatable.dart';

import 'data.dart';

class PointsModel extends Equatable {
  final PointData? data;
  final String? message;
  final int? code;

  const PointsModel({this.data, this.message, this.code});

  factory PointsModel.fromJson(Map<String, dynamic> json) => PointsModel(
        data: json['data'] == null
            ? null
            : PointData.fromJson(json['data'] as Map<String, dynamic>),
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
