import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_viewer_usdz_method_channel.dart';

abstract class FlutterViewerUsdzPlatform extends PlatformInterface {
  /// Constructs a FlutterViewerUsdzPlatform.
  FlutterViewerUsdzPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterViewerUsdzPlatform _instance = MethodChannelFlutterViewerUsdz();

  /// The default instance of [FlutterViewerUsdzPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterViewerUsdz].
  static FlutterViewerUsdzPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterViewerUsdzPlatform] when
  /// they register themselves.
  static set instance(FlutterViewerUsdzPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
