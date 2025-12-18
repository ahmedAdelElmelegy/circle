import 'package:circle/core/network/models/response/category_model/category_data.dart';
import 'package:circle/core/network/models/response/sub_category_model/sub_category_data.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductModelData extends Equatable {
  final num? id;
  final String? title;
  final String? image;
  final num? categoryId;
  final CategoryData? category;
  final num? subCategoryId;
  final SubCategoryData? subCategory;
  final String? details;
  final num? salesLimit;
  final num? price;
  final String? unit;
  num? weightUnit;
  final num? priceWeightUnit;
  final bool? isOffer;
  final num? isActive;
  final dynamic offerType;
  final num? offerValue;
  final String? offerStartDate;
  final String? offerEndDate;
  final num? oldPrice;
  bool? isFavorite;

  ProductModelData({
    this.id,
    this.title,
    this.image,
    this.categoryId,
    this.category,
    this.subCategoryId,
    this.subCategory,
    this.details,
    this.salesLimit,
    this.price,
    this.unit,
    this.weightUnit,
    this.priceWeightUnit,
    this.isOffer,
    this.isActive,
    this.offerType,
    this.offerValue,
    this.offerStartDate,
    this.offerEndDate,
    this.oldPrice,
    this.isFavorite,
  });

  factory ProductModelData.fromJson(Map<String, dynamic> json) =>
      ProductModelData(
        id: json['id'] as num?,
        title: json['title'] as String?,
        image: json['image'] as String?,
        categoryId: json['category_id'] as num?,
        category: json['category'] == null
            ? null
            : CategoryData.fromJson(json['category'] as Map<String, dynamic>),
        subCategoryId: json['sub_category_id'] as num?,
        subCategory: json['sub_category'] == null
            ? null
            : SubCategoryData.fromJson(
                json['sub_category'] as Map<String, dynamic>),
        details: json['details'] as String?,
        salesLimit: json['sales_limit'] as num?,
        price: json['price'] as num?,
        unit: json['unit'] as String?,
        weightUnit: json['weight_unit'] as num?,
        priceWeightUnit: json['price_weight_unit'] as num?,
        isOffer: json['is_offer'] as bool?,
        isActive: json['is_active'] as num?,
        offerType: json['offer_type'] as dynamic,
        offerValue: json['offer_value'] as num?,
        offerStartDate: json['offer_start_date'] as String?,
        offerEndDate: json['offer_end_date'] as String?,
        oldPrice: json['old_price'] as num?,
        isFavorite: json['is_favorite'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'category_id': categoryId,
        'category': category?.toJson(),
        'sub_category_id': subCategoryId,
        'sub_category': subCategory?.toJson(),
        'details': details,
        'sales_limit': salesLimit,
        'price': price,
        'unit': unit,
        'weight_unit': weightUnit,
        'price_weight_unit': priceWeightUnit,
        'is_offer': isOffer,
        'is_active': isActive,
        'offer_type': offerType,
        'offer_value': offerValue,
        'offer_start_date': offerStartDate,
        'offer_end_date': offerEndDate,
        'old_price': oldPrice,
        'is_favorite': isFavorite,
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      image,
      categoryId,
      category,
      subCategoryId,
      subCategory,
      details,
      salesLimit,
      price,
      unit,
      weightUnit,
      priceWeightUnit,
      isOffer,
      isActive,
      offerType,
      offerValue,
      offerStartDate,
      offerEndDate,
      oldPrice,
      isFavorite,
    ];
  }
}
