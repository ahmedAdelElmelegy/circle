import 'package:circle/data/models/response/category_model/category_data.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final List<CategoryData>? data;
  final String? message;
  final int? code;

  const CategoryModel({this.data, this.message, this.code});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
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
