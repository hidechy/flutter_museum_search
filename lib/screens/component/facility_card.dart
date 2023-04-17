import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';

class FacilityCard extends StatelessWidget {
  const FacilityCard({
    super.key,
    this.checkboxCheck,
    this.onChanged,
    required this.dist,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.genre,
    required this.address,
    this.displayCheckBox = false,
  });

  final bool? checkboxCheck;
  final Function(bool?)? onChanged;
  final String dist;
  final String latitude;
  final String longitude;
  final String name;
  final String genre;
  final String address;
  final bool? displayCheckBox;

  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenSize.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (displayCheckBox == true)
            Checkbox(
              value: checkboxCheck,
              activeColor: Colors.yellowAccent.withOpacity(0.2),
              side: BorderSide(color: Colors.white.withOpacity(0.4)),
              onChanged: onChanged,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dist,
                      style: const TextStyle(color: Colors.yellowAccent),
                    ),
                    Text('$latitude / $longitude'),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name),
                      Text(genre),
                      Text(address),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
