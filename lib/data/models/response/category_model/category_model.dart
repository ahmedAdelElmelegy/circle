import 'package:equatable/equatable.dart';

import 'cat_item.dart';

class CategoryModel extends Equatable {
  final List<CatItem>? data;
  final String? message;
  final int? code;

  const CategoryModel({this.data, this.message, this.code});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CatItem.fromJson(e as Map<String, dynamic>))
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












// To parse this JSON data, do
//
//     final categoryModelll = categoryModelllFromJson(jsonString);





class CategoryModelll {
    List<Datum>? data;
    String? message;
    int? code;

    CategoryModelll({
        this.data,
        this.message,
        this.code,
    });

    factory CategoryModelll.fromJson(Map<String, dynamic> json) => CategoryModelll(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "code": code,
    };
}

class Datum {
    int? id;
    String? image;
    String? title;
    List<Datum>? subCategories;
    String? createdAt;

    Datum({
        this.id,
        this.image,
        this.title,
        this.subCategories,
        this.createdAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        subCategories: json["sub_categories"] == null ? [] : List<Datum>.from(json["sub_categories"]!.map((x) => Datum.fromJson(x))),
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "sub_categories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
        "created_at": createdAt,
    };
}
