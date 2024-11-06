import 'package:flutter/services.dart';
import 'platform_interface.dart';

class MethodChannelFlutterViewerUsdz extends FlutterViewerUsdzPlatform {
  final methodChannel = const MethodChannel('flutter_viewer_usdz');

  @override
  Future<bool> loadUSDZFile(String path, {bool isUrl = false}) async {
    try {
      final result = await methodChannel.invokeMethod<bool>('loadUSDZFile', {
        'path': path,
        'isUrl': isUrl,
      });
      return result ?? false;
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
      return false;
    }
  }

  @override
  Future<void> rotateModel(double angle) async {
    try {
      await methodChannel.invokeMethod<void>('rotateModel', {
        'angle': angle,
      });
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }

  @override
  Future<void> dispose() async {
    try {
      await methodChannel.invokeMethod<void>('dispose');
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }
}
