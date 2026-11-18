import 'package:material_ui/material_ui.dart';

/// The app's display name. Shown on the home screen and in the browser tab.
const String appName = 'KEYS Family';

class KeysFamilyApp extends StatelessWidget {
  const KeysFamilyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          appName,
          key: const Key('home-app-name'),
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
