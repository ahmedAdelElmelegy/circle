import 'package:circletraning/features/map/ui/widgets/buttom_sheet_widget.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  static const String routeName = '/map';
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text('Map Screen'),
        ),
        bottomSheet: MapButtomSheet());
  }
}
