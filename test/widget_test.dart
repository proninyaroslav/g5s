// For Icons
import 'package:flutter_test/flutter_test.dart';
import 'package:g5s/main.dart'; // Adjust this path if needed

void main() {
  testWidgets('HomeScreen displays expected texts',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Guest 5 Stars'), findsOneWidget);
    expect(find.text('Поиск данных'), findsOneWidget);
    expect(find.text('RU'), findsOneWidget);
    expect(find.text('Найти'), findsOneWidget);
  });
}
