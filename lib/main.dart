import 'package:material_ui/material_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'config/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final env = Env.fromEnvironment();
  // Supabase is only started when its URL and publishable key were provided at
  // build time, so the app also runs (and tests pass) without a backend.
  if (env.hasSupabase) {
    await Supabase.initialize(
      url: env.supabaseUrl,
      publishableKey: env.supabasePublishableKey,
    );
  }

  runApp(const KeysFamilyApp());
}
