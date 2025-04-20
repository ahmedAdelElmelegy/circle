import 'package:circle/data/models/response/sub_category_model/sub_category_data.dart';
import 'package:equatable/equatable.dart';

class CategoryData extends Equatable {
  final int? id;
  final String? image;
  final String? title;
  final List<SubCategoryData>? subCategories;
  final String? createdAt;

  const CategoryData({
    this.id,
    this.image,
    this.title,
    this.subCategories,
    this.createdAt,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json['id'] as int?,
        image: json['image'] as String?,
        title: json['title'] as String?,
        subCategories: (json['sub_categories'] as List<dynamic>?)
            ?.map((e) => SubCategoryData.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'title': title,
        'sub_categories': subCategories?.map((e) => e.toJson()).toList(),
        'created_at': createdAt,
      };

  @override
  List<Object?> get props => [id, image, title, subCategories, createdAt];
}
