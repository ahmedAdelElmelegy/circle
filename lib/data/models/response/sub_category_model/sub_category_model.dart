import 'package:equatable/equatable.dart';

import 'sub_cat_item.dart';

class SubCategoryModel extends Equatable {
  final List<SubCategoryItem>? data;
  final String? message;
  final int? code;

  const SubCategoryModel({this.data, this.message, this.code});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubCategoryItem.fromJson(e as Map<String, dynamic>))
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
