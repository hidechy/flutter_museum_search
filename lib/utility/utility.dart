// ignore_for_file: depend_on_referenced_packages, type_annotate_public_apis, cascade_invocations, strict_raw_type, noop_primitive_operations

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
}

class NavigationService {
  const NavigationService._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
