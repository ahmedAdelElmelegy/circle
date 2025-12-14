import 'package:equatable/equatable.dart';

class City extends Equatable {
	final int? id;
	final String? title;
	final int? deliveryCost;
	final int? regionId;

	const City({this.id, this.title, this.deliveryCost, this.regionId});

	factory City.fromJson(Map<String, dynamic> json) => City(
				id: json['id'] as int?,
				title: json['title'] as String?,
				deliveryCost: json['delivery_cost'] as int?,
				regionId: json['region_id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'title': title,
				'delivery_cost': deliveryCost,
				'region_id': regionId,
			};

	@override
	List<Object?> get props => [id, title, deliveryCost, regionId];
}
