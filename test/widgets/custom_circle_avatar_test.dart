import 'package:faker_person_api/src/model/person.dart';
import 'package:faker_person_api/src/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createAppWidget(Widget videoAppWidget) =>
    MaterialApp(locale: const Locale('en'), home: videoAppWidget);

void main() {
  testWidgets('Can render from agent', (tester) async {
    final widget = createAppWidget(CustomCircleAvatar(
      person: Person(id: 1, firstname: 'Hoa', lastname: 'Kha'),
    ));
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();

    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.text('HK'), findsOneWidget);
  });
}
