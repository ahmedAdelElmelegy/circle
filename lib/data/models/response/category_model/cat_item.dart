import 'package:circletraning/data/models/response/product_model/sub_category.dart';
import 'package:equatable/equatable.dart';

class CatItem extends Equatable {
  final int? id;
  final String? image;
  final String? title;
  final List<SubCategory>? subCategories;
  final String? createdAt;

  const CatItem({
    this.id,
    this.image,
    this.title,
    this.subCategories,
    this.createdAt,
  });

  factory CatItem.fromJson(Map<String, dynamic> json) => CatItem(
        id: json['id'] as int?,
        image: json['image'] as String?,
        title: json['title'] as String?,
        subCategories: (json['sub_categories'] as List<dynamic>?)
            ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
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
  List<Object?> get props => [id, image, title, createdAt];
}
