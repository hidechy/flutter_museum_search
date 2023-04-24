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
    this.displayDragIndicator = false,
    this.facilitySelectTap,
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
  final bool? displayDragIndicator;
  final VoidCallback? facilitySelectTap;

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
      child: GestureDetector(
        onTap: facilitySelectTap,
        child: AbsorbPointer(
          child: Row(
            children: [
              if (displayCheckBox == true)
                Checkbox(
                  value: checkboxCheck,
                  activeColor: Colors.yellowAccent.withOpacity(0.2),
                  side: BorderSide(color: Colors.white.withOpacity(0.4)),
                  onChanged: onChanged,
                ),
              if (displayDragIndicator == true) ...[
                Icon(
                  Icons.drag_indicator_outlined,
                  color: Colors.white.withOpacity(0.6),
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '現在地点から${dist}',
                            style: const TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            '$latitude / $longitude',
                            style: TextStyle(fontSize: 8),
                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
