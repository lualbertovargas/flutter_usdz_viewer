import 'package:flutter/material.dart';
import 'package:flutter_viewer_usdz/flutter_viewer_usdz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'USDZ Viewer Demo',
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
      url:
          'https://firebasestorage.googleapis.com/v0/b/vbgbouwadvies-f17a0.appspot.com/o/flow_damages%2F51848748-7747-4d04-80e3-337195122835%2Froomplan%2F36ac7954-a5ea-4ac0-910a-68f605b18eac.usdz?alt=media&token=c55c457a-bf06-465d-ae37-754595657a38',
      icon: Icons.home,
      color: Colors.blue,
    ),
    ModelItem(
      name: 'AirPods Max',
      url:
          'https://www.apple.com/105/media/us/airpods-max/2020/996b980b-3131-44f1-af6c-fe72f9b3bfb5/ar/airpods-max_spacegray.usdz',
      icon: Icons.headphones,
      color: Colors.grey[800]!,
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

  const ModelCard({
    super.key,
    required this.model,
  });

  Future<void> _showModel(BuildContext context) async {
    try {
      final viewer = FlutterViewerUsdz();
      await viewer.loadUSDZFile(model.url, isUrl: true);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
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
            ],
          ),
        ),
      ),
    );
  }
}

class ModelItem {
  final String name;
  final String url;
  final IconData icon;
  final Color color;

  const ModelItem({
    required this.name,
    required this.url,
    required this.icon,
    required this.color,
  });
}
