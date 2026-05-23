import 'package:flutter_test/flutter_test.dart';
import 'package:x_ray/main.dart';

void main() {
  testWidgets('XRayApp renders home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const XRayApp());

    expect(find.text('X-Ray'), findsOneWidget);
    expect(find.text('Cut through the noise'), findsOneWidget);
    expect(
      find.text('Search Grok for unfiltered truth...'),
      findsOneWidget,
    );
  });
}
