import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_viewer_usdz/flutter_viewer_usdz.dart';
import 'package:flutter_viewer_usdz/flutter_viewer_usdz_platform_interface.dart';
import 'package:flutter_viewer_usdz/flutter_viewer_usdz_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterViewerUsdzPlatform
    with MockPlatformInterfaceMixin
    implements FlutterViewerUsdzPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterViewerUsdzPlatform initialPlatform = FlutterViewerUsdzPlatform.instance;

  test('$MethodChannelFlutterViewerUsdz is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterViewerUsdz>());
  });

  test('getPlatformVersion', () async {
    FlutterViewerUsdz flutterViewerUsdzPlugin = FlutterViewerUsdz();
    MockFlutterViewerUsdzPlatform fakePlatform = MockFlutterViewerUsdzPlatform();
    FlutterViewerUsdzPlatform.instance = fakePlatform;

    expect(await flutterViewerUsdzPlugin.getPlatformVersion(), '42');
  });
}
