import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';

class FacilityCard extends StatelessWidget {
  const FacilityCard({
    super.key,
    this.checkboxCheck,
    this.itemSelectTap,
    required this.dist,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.genre,
    required this.address,
    this.displayCheckBox = false,
    this.displayRoutesButton = false,
    this.routesButtonTap,
    this.displayDragIndicator = false,
  });

  final bool? checkboxCheck;
  final VoidCallback? itemSelectTap;
  final String dist;
  final String latitude;
  final String longitude;
  final String name;
  final String genre;
  final String address;
  final bool? displayCheckBox;
  final bool? displayRoutesButton;
  final VoidCallback? routesButtonTap;
  final bool? displayDragIndicator;

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
        onTap: itemSelectTap,
        child: AbsorbPointer(
          child: Row(
            children: [
              if (displayCheckBox == true)
                Checkbox(
                  value: checkboxCheck,
                  activeColor: Colors.yellowAccent.withOpacity(0.2),
                  side: BorderSide(color: Colors.white.withOpacity(0.4)),
                  onChanged: (value) {},
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
                      if (displayRoutesButton == true)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              GestureDetector(
                                onTap: routesButtonTap,
                                child: Icon(
                                  Icons.stacked_line_chart,
                                  size: 20,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
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
