import 'package:equatable/equatable.dart';

class SSlider extends Equatable {
  final int? id;
  final String? image;
  final int? categoryId;
  final int? subCategoryId;

  const SSlider({this.id, this.image, this.categoryId, this.subCategoryId});

  factory SSlider.fromJson(Map<String, dynamic> json) => SSlider(
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
