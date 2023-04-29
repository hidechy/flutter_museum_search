// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../extensions/extensions.dart';
import '../../state/select_route/select_route_notifier.dart';
import 'museum_search_dialog.dart';
import 'select_route_display_alert.dart';

class RouteDisplaySettingAlert extends ConsumerWidget {
  RouteDisplaySettingAlert({super.key});

  DateTime selectedDateTime = DateTime.now();

  final TextEditingController speedTextController = TextEditingController();
  final TextEditingController spotStayTimeTextController =
      TextEditingController();
  final TextEditingController adjustPercentTextController =
      TextEditingController();

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectRouteState = ref.watch(selectRouteProvider);

    final timeFormat = DateFormat('HH:mm');
    final startTime = (selectRouteState.startTime != '')
        ? timeFormat.format(DateTime.parse(selectRouteState.startTime))
        : timeFormat.format(selectedDateTime);

    speedTextController.text = selectRouteState.walkSpeed.toString();
    spotStayTimeTextController.text = selectRouteState.spotStayTime.toString();
    adjustPercentTextController.text =
        selectRouteState.adjustPercent.toString();

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 12),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(width: context.screenSize.width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Row(
                        children: [
                          const Text('出発時刻：'),
                          if (selectRouteState.startNow) const Text('(現在時刻)'),
                          Text(startTime),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () {
                          DatePicker.showDateTimePicker(
                            context,
                            theme: const DatePickerTheme(
                              backgroundColor: Colors.black,
                              cancelStyle: TextStyle(color: Colors.white),
                              doneStyle: TextStyle(color: Colors.white),
                              itemStyle: TextStyle(color: Colors.white),
                            ),
                            onConfirm: (date) {
                              selectedDateTime = date;

                              ref
                                  .watch(selectRouteProvider.notifier)
                                  .setSelectDate(date: date.toString());
                            },
                            currentTime: DateTime.now(),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '出発時刻を\n変更する',
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.white.withOpacity(0.2),
                  thickness: 2,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text('歩く速度（時速）：'),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 2,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        controller: speedTextController,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text('Km'),
                  ],
                ),
                Divider(
                  color: Colors.white.withOpacity(0.2),
                  thickness: 2,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text('施設滞在時間：'),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 2,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        controller: spotStayTimeTextController,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text('分'),
                  ],
                ),
                Divider(
                  color: Colors.white.withOpacity(0.2),
                  thickness: 2,
                ),
                Row(
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text('調整率：'),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 2,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        controller: adjustPercentTextController,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text('%'),
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {
                    if (selectRouteState.startNow) {
                      await ref
                          .watch(selectRouteProvider.notifier)
                          .setSelectDate(date: selectedDateTime.toString());
                    }

                    await ref
                        .watch(selectRouteProvider.notifier)
                        .setWalkSpeed(speed: speedTextController.text.toInt());

                    await ref
                        .watch(selectRouteProvider.notifier)
                        .setSpotStayTime(
                            time: spotStayTimeTextController.text.toInt());

                    await ref
                        .watch(selectRouteProvider.notifier)
                        .setAdjustPercent(
                            adjust: adjustPercentTextController.text.toInt());

                    await MuseumSearchDialog(
                      context: context,
                      widget: SelectRouteDisplayAlert(),
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '設定結果を確認する',
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
