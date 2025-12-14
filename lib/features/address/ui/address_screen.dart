import 'dart:convert';
import 'package:circle/core/helpers/app_method.dart';
import 'package:circle/data/models/body/pace_suggestion_model.dart';
import 'package:circle/data/provider/calculate_order_cost_provider.dart';
import 'package:circle/features/address/widgets/address_flutter_map_section.dart';
import 'package:circle/features/address/widgets/address_search_bar.dart';
import 'package:circle/features/address/widgets/location_button.dart';
import 'package:circle/features/address/widgets/search_result.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late final MapController mapController;
  final TextEditingController searchController = TextEditingController();

  List<PlaceSuggestion> suggestions = [];
  bool isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _initUserLocation();
  }

  @override
  void dispose() {
    mapController.dispose();
    searchController.dispose();
    super.dispose();
  }

  Future<void> _initUserLocation() async {
    try {
      setState(() => isLoadingLocation = true);
      final position = await _determinePosition();
      if (mounted) {
        final provider =
            Provider.of<CalculateOrderCostProvider>(context, listen: false);

        provider.position = position;
        _moveMap(position.latitude, position.longitude, 15);
      }
    } catch (_) {}
    setState(() => isLoadingLocation = false);
  }

  Future<Position> _determinePosition() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw Exception('Location disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Permission denied forever');
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }

  void _moveMap(double lat, double lng, double zoom) {
    mapController.move(LatLng(lat, lng), zoom);
  }

  Future<void> _searchPlaces(String query) async {
    if (query.isEmpty) {
      suggestions.clear();
      setState(() {});
      return;
    }

    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/search'
      '?q=$query&format=json&limit=5',
    );

    final response = await http.get(
      url,
      headers: {'User-Agent': 'circle-app'},
    );

    final List data = jsonDecode(response.body);
    suggestions = data.map((e) => PlaceSuggestion.fromJson(e)).toList();
    setState(() {});
  }

  void _selectPlace(
      PlaceSuggestion place, CalculateOrderCostProvider provider) {
    provider.position = Position(
      latitude: place.lat,
      longitude: place.lon,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
      altitudeAccuracy: 0,
      headingAccuracy: 0,
    );

    searchController.text = place.displayName;
    suggestions.clear();
    _moveMap(place.lat, place.lon, 16);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CalculateOrderCostProvider>();

    return Scaffold(
      appBar: customAppBar('arrive_address'.tr(), context),
      body: Stack(
        children: [
          AddressFlutterMapsSection(
              mapController: mapController, provider: provider),
          Positioned(
            top: 16.h,
            left: 12.w,
            right: 12.w,
            child: AddressSearchBar(
              provider: provider,
              searchController: searchController,
              onChanged: _searchPlaces,
            ),
          ),
          if (suggestions.isNotEmpty)
            Positioned(
                top: 75.h,
                left: 12.w,
                right: 12.w,
                child: SearchResult(
                    suggestions: suggestions,
                    provider: provider,
                    onItemTap: (index) =>
                        _selectPlace(suggestions[index], provider)))
        ],
      ),
      floatingActionButton: LocationButton(
        initUserLocation: _initUserLocation,
        isLoadingLocation: isLoadingLocation,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
