import 'package:flutter/material.dart';
import 'package:flutter_viewer_usdz/flutter_viewer_usdz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'USDZ Viewer Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ModelItem> models = [
    ModelItem(
      name: 'Room Plan',
      path: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
      icon: Icons.home,
      color: Colors.blue,
      isLocal: false,
    ),
    ModelItem(
      name: 'AirPods Max',
      path: 'assets/model.usdz',
      icon: Icons.headphones,
      color: Colors.grey[800]!,
      isLocal: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('USDZ Models'),
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: models.length,
        itemBuilder: (context, index) {
          final model = models[index];
          return ModelCard(model: model);
        },
      ),
    );
  }
}

class ModelCard extends StatelessWidget {
  final ModelItem model;
  final _viewer = FlutterViewerUsdz();

  ModelCard({
    super.key,
    required this.model,
  });

  Future<void> _showModel(BuildContext context) async {
    try {
      final success = model.isLocal
          ? await _viewer.loadUSDZFileFromPath(model.path)
          : await _viewer.loadUSDZFileFromUrl(model.path);

      if (!success && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Failed to load ${model.isLocal ? 'local' : 'remote'} model'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading ${model.name}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => _showModel(context),
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                model.color.withOpacity(0.7),
                model.color,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                model.icon,
                size: 48,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                model.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                model.isLocal ? 'Local File' : 'Remote URL',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModelItem {
  final String name;
  final String path;
  final IconData icon;
  final Color color;
  final bool isLocal;

  const ModelItem({
    required this.name,
    required this.path,
    required this.icon,
    required this.color,
    required this.isLocal,
  });
}
