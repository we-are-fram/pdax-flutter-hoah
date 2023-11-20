import 'package:faker_person_api/src/pages/home/controller.dart';
import 'package:faker_person_api/src/pages/home/page.dart';
import 'package:faker_person_api/src/pages/person_details/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../mock_app.dart';

void main() {
  late MockApp mockApp;

  setUp(() async {
    mockApp = await MockAppUtil.createMockApp(
      child: const HomePage(),
      bindings: () {
        Get.put<HomeController>(HomeController(
          Get.find(),
        ));
      },
    );
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('Can render', (WidgetTester tester) async {
    await tester.pumpWidget(mockApp);
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(ListTile), findsWidgets);
    expect(find.byKey(const ValueKey('end_txt')), findsNothing);

    await tester.drag(find.byType(ListView), const Offset(0.0, -2000));
    await tester.pumpAndSettle();
    await tester.drag(find.byType(ListView), const Offset(0.0, -2000));
    await tester.pumpAndSettle();
    await tester.drag(find.byType(ListView), const Offset(0.0, -2000));
    await tester.pumpAndSettle();
    await tester.drag(find.byType(ListView), const Offset(0.0, -2000));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('end_txt')), findsOneWidget);
  });

  testWidgets('Can navigate to detail page', (WidgetTester tester) async {
    await tester.pumpWidget(mockApp);
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);

    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();
    expect(find.byType(PersonDetailsPage), findsOneWidget);
    expect(find.text('Email address'), findsOneWidget);
    expect(find.text('Phone number'), findsOneWidget);
    expect(find.text('Date of birth'), findsOneWidget);
    expect(find.text('Address'), findsNothing);
    expect(find.text('Website'), findsOneWidget);
  });
}
