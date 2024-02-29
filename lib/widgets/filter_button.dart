import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(
      {super.key,
      required this.index,
      required this.selectedFilter,
      required this.filters});

  final int index;
  final int selectedFilter;
  final List<String> filters;

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: BorderSide(style: BorderStyle.none),
      ),
      backgroundColor: selectedFilter == index ? Colors.amber : Colors.blue[50],
      labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      label: Text(
        textAlign: TextAlign.center,
        filters[index],
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
      ),
    );
  }
}
