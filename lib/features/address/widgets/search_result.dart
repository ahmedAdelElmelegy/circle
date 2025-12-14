import 'package:circle/data/models/body/pace_suggestion_model.dart';
import 'package:circle/data/provider/calculate_order_cost_provider.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  final List<PlaceSuggestion> suggestions;
  final CalculateOrderCostProvider provider;
  final void Function()? onTap;
  final void Function(int currentIndex)? onItemTap;
  const SearchResult(
      {super.key,
      required this.suggestions,
      required this.provider,
      this.onTap,
      this.onItemTap});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.suggestions.length,
        itemBuilder: (context, index) {
          final place = widget.suggestions[index];
          return ListTile(
            title: Text(place.displayName),
            onTap: () {
              widget.onItemTap?.call(index);
              widget.onTap?.call();
            },
          );
        },
      ),
    );
  }
}
