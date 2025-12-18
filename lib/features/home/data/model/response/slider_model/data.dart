import 'package:equatable/equatable.dart';

import 'slider.dart';

class Data extends Equatable {
  final List<SSlider>? slider;
  final int? notificationCount;

  const Data({this.slider, this.notificationCount});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        slider: (json['slider'] as List<dynamic>?)
            ?.map((e) => SSlider.fromJson(e as Map<String, dynamic>))
            .toList(),
        notificationCount: json['notification_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'slider': slider?.map((e) => e.toJson()).toList(),
        'notification_count': notificationCount,
      };

  @override
  List<Object?> get props => [slider, notificationCount];
}
