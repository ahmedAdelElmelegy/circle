import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/features/map/presentation/view/widgets/buttom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Map<String, dynamic>> branches = [
    {
      'name': 'فرع شارع الجمهورية',
      'lat': 30.0456,
      'lng': 31.2348,
    },
    {
      'name': 'فرع شارع النصر',
      'lat': 30.0490,
      'lng': 31.2400,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBarWithoutLeading('branchs', context),
        body: Center(
            child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(30.03, 31.22),
                  initialZoom: 12,
                ),
                children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              MarkerLayer(
                markers: branches
                    .map((e) => Marker(
                        width: 40,
                        height: 40,
                        point: LatLng(e['lat'], e['lng']),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40.sp,
                        )))
                    .toList(),
              )
            ])),
        bottomSheet: MapButtomSheet(
          branches: branches,
        ));
  }
}
