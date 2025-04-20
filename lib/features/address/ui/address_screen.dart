import 'package:circletraning/core/helpers/app_method.dart';
import 'package:circletraning/core/helpers/constants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theme/color_manager.dart';
import 'package:circletraning/core/theme/styles.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/data/provider/calculate_order_cost_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

const kGoogleApiKey = 'AIzaSyBW-11ZkP5uG-5WK5aflOIRU5s6SU-km80';
// final Mode _mode = Mode.overlay;
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _AddressScreenState extends State<AddressScreen> {
  late CameraPosition cameraPosition;
  GoogleMapController? mapController;

  final Set<Marker> markers = {};
  @override
  void initState() {
    cameraPosition = const CameraPosition(
        target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculateOrderCostProvider>(context);
    return Scaffold(
      appBar: customAppBar('arrive_address'.tr(), context),
      key: homeScaffoldKey,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: cameraPosition,
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (controller) {
              mapController = controller;
            },
          ),
          Positioned(
            top: 19.h,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48.h,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'search_about_city'.tr(),
                          hintStyle: TextStyles.font12MadaRegularGray,
                          filled: true,
                          suffixIcon: const Icon(
                            Icons.search,
                            color: ColorManger.red,
                          ),
                          border: outlineBorder(),
                          enabledBorder: outlineBorder(),
                          focusedBorder: outlineBorder(),
                          fillColor: ColorManger.white,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace(8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManger.red,
                        minimumSize: Size(48.w, 48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        )),
                    onPressed: () async {
                      provider.position = await _determinePosition();
                      provider.getAddressFromLatLng();
                    },
                    child: SvgIcon(
                      AppIcons.singleCheck,
                      width: 12,
                      height: 12,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorManger.red,
        onPressed: () async {
          Position position = await _determinePosition();
          mapController!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              ),
            ),
          );
          markers.clear();
          markers.add(
            Marker(
              markerId: const MarkerId('cureent_location'),
              position: LatLng(position.latitude, position.longitude),
            ),
          );

          setState(() {});
        },
        icon: SvgIcon(
          AppIcons.myLocation,
          color: Colors.white,
        ),
        label: Text(
          'my_location'.tr(),
          style: TextStyles.font14MadaRegularWith,
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide.none);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  // Future<void> hendlePlacedButton({
  //   required BuildContext context,
  // }) async {
  //   Prediction? p = await PlacesAutocomplete.show(
  //     context: context,
  //     apiKey: kGoogleApiKey,
  //     onError: onError,
  //     mode: _mode,
  //     language: 'en',
  //     strictbounds: false,
  //     types: [''],
  //     textDecoration: InputDecoration(
  //       hintText: 'Search',
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //         borderSide: BorderSide(color: Colors.white, width: 2),
  //       ),
  //     ),
  //     components: [
  //       Component(Component.country, 'pk'),
  //     ],
  //   );

  //   displayPrediction(p!, homeScaffoldKey.currentState);
  // }

  // void onError(PlacesAutocompleteResponse response) {
  //   homeScaffoldKey.currentState!.showBottomSheet(
  //     (builder) => Text(response.errorMessage!),
  //   );
  // }

  // Future<void> displayPrediction(
  //     Prediction p, ScaffoldState? currentState) async {
  //   GoogleMapsPlaces places = GoogleMapsPlaces(
  //     apiKey: kGoogleApiKey,
  //     apiHeaders: await const GoogleApiHeaders().getHeaders(),
  //   );
  //   PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
  //   final lat = detail.result.geometry!.location.lat;
  //   final lng = detail.result.geometry!.location.lng;
  //   markers.clear();
  //   markers.add(
  //     Marker(
  //       markerId: const MarkerId('0'),
  //       position: LatLng(lat, lng),
  //       infoWindow: InfoWindow(title: detail.result.name),
  //     ),
  //   );
  //   setState(() {});
  //   mapController!
  //       .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14));
  // }
}
