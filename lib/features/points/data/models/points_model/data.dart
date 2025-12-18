import 'package:equatable/equatable.dart';

class PointData extends Equatable {
  final int? points;
  final List<dynamic>? history;

  const PointData({this.points, this.history});

  factory PointData.fromJson(Map<String, dynamic> json) => PointData(
        points: json['points'] as int?,
        history: json['history'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'points': points,
        'history': history,
      };

  @override
  List<Object?> get props => [points, history];
}
