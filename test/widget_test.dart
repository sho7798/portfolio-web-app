import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:portfolio_app/app/portfolio_app.dart';
import 'package:portfolio_app/features/portfolio/data/portfolio_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Portfolio app renders hero content', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text(PortfolioData.personName), findsOneWidget);
    expect(find.text(PortfolioData.personRole), findsOneWidget);
    expect(find.text(PortfolioData.intro), findsOneWidget);
  });
}
