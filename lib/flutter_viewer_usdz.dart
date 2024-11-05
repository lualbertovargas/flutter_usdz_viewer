
import 'flutter_viewer_usdz_platform_interface.dart';

class FlutterViewerUsdz {
  Future<String?> getPlatformVersion() {
    return FlutterViewerUsdzPlatform.instance.getPlatformVersion();
  }
}
