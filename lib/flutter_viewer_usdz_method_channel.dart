import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_viewer_usdz_platform_interface.dart';

/// An implementation of [FlutterViewerUsdzPlatform] that uses method channels.
class MethodChannelFlutterViewerUsdz extends FlutterViewerUsdzPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_viewer_usdz');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
