import 'package:rising_gym/tdd/presentaion/view/components/kiosk_container/kiosk_container.dart';
import 'package:rising_gym/tdd/presentaion/view/screens/home/home.dart';
import 'package:rising_gym/tdd/presentaion/view/widgets/expansion_widget/expansion_list.dart';
import 'package:rising_gym/tdd/presentaion/view/widgets/list/expansion_drawer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("Testing Expandable Widgets Data", (WidgetTester tester) async {
    // Assert
   await tester.pumpWidget(const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home: KioskHomeContainer())
    ));
    expect(find.byType(ExpansionDrawerListView),findsOneWidget);
    expect(find.text("Categories 1"), findsNWidgets(10));
    expect(find.text("Sub Categories 1"), findsNWidgets(10));
  });
  testWidgets("Testing Expandable Widgets With no Sub Group Product", (WidgetTester tester) async {
    // Assert
   await tester.pumpWidget(const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home:  Card(child: ExpansionDrawer(title:Text("Category No Sub group"),)))
    ));
    expect(find.text("Category No Sub group"), findsOneWidget);
    expect(find.text("Sub Categories 1"), findsNothing);
  });
}