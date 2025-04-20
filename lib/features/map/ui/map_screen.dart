import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/features/map/ui/widgets/buttom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = '/map';
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late CameraPosition initialCameraPosition;
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
  Set<Marker> markers = {};
  @override
  void initState() {
    markers = branches
        .map((branch) => Marker(
            markerId: MarkerId(branch['name']),
            position: LatLng(branch['lat'], branch['lng']),
            infoWindow: InfoWindow(title: branch['name'])))
        .toSet();
    initialCameraPosition = CameraPosition(
        target: LatLng(branches[0]['lat'], branches[0]['lng']), zoom: 14);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBarWithoutLeading('branchs', context),
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          markers: markers,
        ),
        bottomSheet: MapButtomSheet(
          branches: branches,
        ));
  }
}
// 30.052814750666066, 31.246808002310637
// 29.9563838168789, 31.28742166672457
