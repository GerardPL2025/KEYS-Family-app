import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:keys_family/app.dart';
import 'package:keys_family/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('user opens the app and sees the home screen', (tester) async {
    await app.main();
    await tester.pumpAndSettle();

    expect(find.text(appName), findsOneWidget);
  });
}
