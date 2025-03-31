import 'package:equatable/equatable.dart';

class SubCategoryData extends Equatable {
  final int? id;
  final String? image;
  final String? title;
  final List<dynamic>? subCategories;
  final String? createdAt;

  const SubCategoryData({
    this.id,
    this.image,
    this.title,
    this.subCategories,
    this.createdAt,
  });

  factory SubCategoryData.fromJson(Map<String, dynamic> json) =>
      SubCategoryData(
        id: json['id'] as int?,
        image: json['image'] as String?,
        title: json['title'] as String?,
        subCategories: json['sub_categories'] as List<dynamic>?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'title': title,
        'sub_categories': subCategories,
        'created_at': createdAt,
      };

  @override
  List<Object?> get props => [id, image, title, subCategories, createdAt];
}
