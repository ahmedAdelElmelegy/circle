import 'package:equatable/equatable.dart';

class Sslider extends Equatable {
  final int? id;
  final String? image;
  final int? categoryId;
  final int? subCategoryId;

  const Sslider({
    this.id,
    this.image,
    this.categoryId,
    this.subCategoryId,
  });

  factory Sslider.fromJson(Map<String, dynamic> json) => Sslider(
        id: json['id'] as int?,
        image: json['image'] as String?,
        categoryId: json['category_id'] as int?,
        subCategoryId: json['sub_category_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'category_id': categoryId,
        'sub_category_id': subCategoryId,
      };

  @override
  List<Object?> get props => [id, image, categoryId, subCategoryId];
}
