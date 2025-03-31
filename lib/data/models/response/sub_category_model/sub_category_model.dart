import 'package:equatable/equatable.dart';

import 'sub_category_data.dart';

class SubCategoryModel extends Equatable {
  final List<SubCategoryData>? data;
  final String? message;
  final int? code;

  const SubCategoryModel({this.data, this.message, this.code});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubCategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
        'code': code,
      };

  @override
  List<Object?> get props => [data, message, code];
}
