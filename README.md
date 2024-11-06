# flutter_viewer_usdz

Flutter plugin project that allows you to display USDZ models from a url.

## Demonstration

<div style="display: flex; justify-content: center; align-items: center; flex-wrap: wrap;">
  <img src="https://i.imgur.com/5fnfAIW.jpeg" alt="Left Image" width="250" height="500" style="margin-right: 10px;"/>
  <img src="https://i.imgur.com/7Uepigr.gif" alt="Demonstration" width="250" height="500" style="margin: 0 10px;"/>
  <img src="https://i.imgur.com/1q0F9XK.jpeg" alt="Right Image" width="250" height="500" style="margin-left: 10px;"/>
</div>

## Introduction

This project is a starting point for a [plugin package](https://flutter.dev/to/develop-plugins) for Flutter, which includes platform-specific implementation code for Android and/or iOS.

## Repository

You can find the source code at the following link: [flutter_usdz_viewer](https://github.com/lualbertovargas/flutter_usdz_viewer).

## Installation

To install this plugin, add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_viewer_usdz: ^0.0.5
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
