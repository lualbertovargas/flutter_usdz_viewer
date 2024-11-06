# flutter_viewer_usdz

A new Flutter plugin project that allows you to visualize USDZ models.

## Demonstration

<div style="text-align: center;">
  <video width="375" controls>
    <source src="https://i.imgur.com/BaXR24R.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>
</div>

## Introduction

This project is a starting point for a [plugin package](https://flutter.dev/to/develop-plugins) for Flutter, which includes platform-specific implementation code for Android and/or iOS.

## Repository

You can find the source code at the following link: [flutter_usdz_viewer](https://github.com/lualbertovargas/flutter_usdz_viewer).

## Installation

To install this plugin, add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_viewer_usdz: ^0.0.2
```

Then, run the following command to install the dependencies:

```bash
flutter pub get
```

## Usage

To use the plugin, import the package in your Dart file:

```dart
import 'package:flutter_viewer_usdz/flutter_viewer_usdz.dart';
```

You can then use the functionalities of the plugin in your application.

### Example

Here is a basic example of how to use the plugin:

```dart
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'USDZ Viewer Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('USDZ Models')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final viewer = FlutterViewerUsdz();
            await viewer.loadUSDZFile('url_del_modelo.usdz', isUrl: true);
          },
          child: const Text('Load USDZ Model'),
        ),
      ),
    );
  }
}
```

## Contributions

Contributions are welcome. If you would like to contribute, please open an issue or a pull request.

## Documentation

For help with Flutter development, check out the [online documentation](https://docs.flutter.dev), which offers tutorials, examples, and a full API reference.
