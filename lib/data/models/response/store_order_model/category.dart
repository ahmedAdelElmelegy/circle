import 'package:equatable/equatable.dart';

import 'sub_category.dart';

class Category extends Equatable {
	final int? id;
	final String? image;
	final String? title;
	final List<SubCategory>? subCategories;
	final String? createdAt;

	const Category({
		this.id, 
		this.image, 
		this.title, 
		this.subCategories, 
		this.createdAt, 
	});

	factory Category.fromJson(Map<String, dynamic> json) => Category(
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
	List<Object?> get props => [id, image, title, subCategories, createdAt];
}
