// ignore_for_file: depend_on_referenced_packages, type_annotate_public_apis, cascade_invocations, strict_raw_type, noop_primitive_operations

import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utility {
  ///
  void showError(String msg) {
    ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  ///
  void showErrorMessage({
    required BuildContext context,
    required String message,
    required int ms,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: ms),
        backgroundColor: Colors.black,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }

  ///
  List<Color> getTwelveColor() {
    return [
      const Color(0xffdb2f20),
      const Color(0xffefa43a),
      const Color(0xfffdf551),
      const Color(0xffa6c63d),
      const Color(0xff439638),
      const Color(0xff469c9e),
      const Color(0xff48a0e1),
      const Color(0xff3070b1),
      const Color(0xff020c75),
      const Color(0xff931c7a),
      const Color(0xffdc2f81),
      const Color(0xffdb2f5c),
    ];
  }

  /// 画像をUint8List形式に変換する関数
  /// https://techsmeme.com/flutter-marker-image/
  Future<Uint8List> imageChangeUint8List(
    String path,
    int height,
    int width,
  ) async {
    final byteData = await rootBundle.load(path);

    final codec = await ui.instantiateImageCodec(
      byteData.buffer.asUint8List(),
      targetHeight: height,
      targetWidth: width,
    );

    final uiFI = await codec.getNextFrame();

    final bData = await uiFI.image.toByteData(format: ui.ImageByteFormat.png);

    return bData!.buffer.asUint8List();
  }

  ///
  String calcDistance({
    required double originLat,
    required double originLng,
    required double destLat,
    required double destLng,
  }) {
    final distanceKm = 6371 *
        acos(
          cos(originLat / 180 * pi) *
                  cos((destLng - originLng) / 180 * pi) *
                  cos(destLat / 180 * pi) +
              sin(originLat / 180 * pi) * sin(destLat / 180 * pi),
        );

    final exDistance = distanceKm.toString().split('.');

    final seisuu = exDistance[0];
    final shousuu = exDistance[1].substring(0, 2);

    return '$seisuu.$shousuu';
  }
}

class NavigationService {
  const NavigationService._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
