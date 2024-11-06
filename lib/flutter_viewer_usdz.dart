import 'package:flutter_viewer_usdz/src/platform_interface.dart';

export 'src/platform_interface.dart';
export 'src/method_channel.dart';

class FlutterViewerUsdz {
  static final FlutterViewerUsdz _instance = FlutterViewerUsdz._internal();

  factory FlutterViewerUsdz() => _instance;

  FlutterViewerUsdz._internal();

  Future<bool> loadUSDZFile(String path, {bool isUrl = false}) {
    return FlutterViewerUsdzPlatform.instance.loadUSDZFile(path, isUrl: isUrl);
  }

  Future<void> rotateModel(double angle) {
    return FlutterViewerUsdzPlatform.instance.rotateModel(angle);
  }

  Future<void> dispose() {
    return FlutterViewerUsdzPlatform.instance.dispose();
  }
}
