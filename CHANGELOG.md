## 0.0.7
-There were only adjustments in images and package description.


## 0.0.6
-Separated into two methods according to the origin of the information:
    Local file the method is loadUSDZFileFromPath()
    External URL the method is loadUSDZFileFromUrl()
- Better documentation of flutter_viewer_usdz.dart
- Two more descriptive examples were placed according to the information

## 0.0.5
-There were only adjustments in images and package description.

## 0.0.4
-There were only adjustments in images and package description.

## 0.0.3
-There were only adjustments in images and package description.

## 0.0.2

- Updated the plugin version.
- Improved the project description in the `pubspec.yaml` file.
- Added the GitHub repository URL in the `pubspec.yaml` file.
- Implemented loading USDZ files from URL or local file system.
- Integrated with `QLPreviewController` for viewing USDZ models on iOS.
- Available methods:
  - `loadUSDZFile(String path, {bool isUrl = false})`: Loads a USDZ file.
  - `rotateModel(double angle)`: Rotates the loaded model.
  - `dispose()`: Releases resources used by the plugin.

## 0.0.1
- Initial release of the `flutter_viewer_usdz` plugin.
