import 'package:flutter_test/flutter_test.dart';
import 'package:keys_family/app.dart';
import 'package:keys_family/config/env.dart';

void main() {
  group('Env', () {
    test('hasSupabase is false when values are missing', () {
      const env = Env(supabaseUrl: '', supabasePublishableKey: '');
      expect(env.hasSupabase, isFalse);
    });

    test('hasSupabase is true when both values are set', () {
      const env = Env(
        supabaseUrl: 'https://example.supabase.co',
        supabasePublishableKey: 'publishable-key',
      );
      expect(env.hasSupabase, isTrue);
    });
  });

  testWidgets('home screen shows the app name', (tester) async {
    await tester.pumpWidget(const KeysFamilyApp());

    expect(find.text(appName), findsOneWidget);
  });
}
