import 'package:flutter_test/flutter_test.dart';
import 'package:art_space/main.dart';

void main() {
  testWidgets('Art Space app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const ArtSpaceApp());

    expect(find.text('Beautiful Flower Girl'), findsOneWidget);
    expect(find.text('Previous'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
  });

  testWidgets('Next button displays the second artwork',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ArtSpaceApp());

    await tester.tap(find.text('Next'));
    await tester.pump();

    expect(find.text('Flower Girl at the Beach'), findsOneWidget);
  });
}
