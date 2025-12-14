import 'package:circle/data/provider/calculate_order_cost_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class AddressFlutterMapsSection extends StatefulWidget {
  final MapController mapController;
  final CalculateOrderCostProvider provider;
  const AddressFlutterMapsSection(
      {super.key, required this.mapController, required this.provider});

  @override
  State<AddressFlutterMapsSection> createState() =>
      _AddressFlutterMapsSectionState();
}

class _AddressFlutterMapsSectionState extends State<AddressFlutterMapsSection> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: widget.mapController,
      options: MapOptions(
        initialCenter: const LatLng(30.03, 31.22),
        initialZoom: 12,
        onTap: (tapPos, latLng) {
          widget.provider.position = Position(
            latitude: latLng.latitude,
            longitude: latLng.longitude,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          );
          setState(() {});
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        if (widget.provider.position != null)
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(
                  widget.provider.position!.latitude,
                  widget.provider.position!.longitude,
                ),
                child: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.red,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
