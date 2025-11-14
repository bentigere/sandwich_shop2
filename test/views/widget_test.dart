import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';

void main() {
  group('App', () {
    testWidgets('renders OrderScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(OrderScreen), findsOneWidget);
    });
  });

  group('OrderScreen - Quantity', () {
    testWidgets('shows initial quantity and title',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
      expect(find.text('Sandwich Counter'), findsOneWidget);
    });

    testWidgets('increments quantity when Add is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      expect(find.text('1 white footlong sandwich(es): 🥪'), findsOneWidget);
    });

    testWidgets('decrements quantity when Remove is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      expect(find.text('1 white footlong sandwich(es): 🥪'), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('does not decrement below zero', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('does not increment above maxQuantity',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      for (int i = 0; i < 10; i++) {
        await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
        await tester.pump();
      }
      expect(find.text('5 white footlong sandwich(es): 🥪🥪🥪🥪🥪'),
          findsOneWidget);
    });
  });

  group('OrderScreen - Controls', () {
    testWidgets('changes bread type with DropdownMenu',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle(); // Ensure the app is fully rendered
      await tester.tap(find.byType(DropdownMenu<BreadType>)); // Ensure DropdownButton is rendered
      await tester.pumpAndSettle();
      await tester.tap(find.text('wheat').last);
      await tester.pumpAndSettle();
      expect(find.textContaining('wheat footlong sandwich'), findsOneWidget);
      await tester.tap(find.byType(DropdownMenu<BreadType>)); // Ensure DropdownButton is rendered
      await tester.pumpAndSettle();
      await tester.tap(find.text('wholemeal').last);
      await tester.pumpAndSettle();
      expect(
          find.textContaining('wholemeal footlong sandwich'), findsOneWidget);
    });

    testWidgets('updates note with TextField', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.enterText(
          find.byKey(const Key('notes_textfield')), 'Extra mayo');
      await tester.pump();
      expect(find.text('Note: Extra mayo'), findsOneWidget);
    });
  });

  group('StyledButton', () {
    testWidgets('renders with icon and label', (WidgetTester tester) async {
      const testButton = StyledButton(
        onPressed: null,
        icon: Icons.add,
        label: 'Test Add',
        backgroundColor: Colors.blue,
      );
      const testApp = MaterialApp(
        home: Scaffold(body: testButton),
      );
      await tester.pumpWidget(testApp);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Add'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('OrderItemDisplay', () {
    testWidgets('shows correct text and note for zero sandwiches',
        (WidgetTester tester) async {
      const widgetToBeTested = OrderItemDisplay(
        quantity: 0,
        itemType: 'footlong',
        breadType: BreadType.white,
        orderNote: 'No notes added.',
      );
      const testApp = MaterialApp(
        home: Scaffold(body: widgetToBeTested),
      );
      await tester.pumpWidget(testApp);
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
      expect(find.text('Note: No notes added.'), findsOneWidget);
    });

    testWidgets('shows correct text and emoji for three sandwiches',
        (WidgetTester tester) async {
      const widgetToBeTested = OrderItemDisplay(
        quantity: 3,
        itemType: 'footlong',
        breadType: BreadType.white,
        orderNote: 'No notes added.',
      );
      const testApp = MaterialApp(
        home: Scaffold(body: widgetToBeTested),
      );
      await tester.pumpWidget(testApp);
      expect(
          find.text('3 white footlong sandwich(es): 🥪🥪🥪'), findsOneWidget);
      expect(find.text('Note: No notes added.'), findsOneWidget);
    });

    testWidgets('shows correct bread and type for two six-inch wheat',
        (WidgetTester tester) async {
      const widgetToBeTested = OrderItemDisplay(
        quantity: 2,
        itemType: 'six-inch',
        breadType: BreadType.wheat,
        orderNote: 'No pickles',
      );
      const testApp = MaterialApp(
        home: Scaffold(body: widgetToBeTested),
      );
      await tester.pumpWidget(testApp);
      expect(find.text('2 wheat six-inch sandwich(es): 🥪🥪'), findsOneWidget);
      expect(find.text('Note: No pickles'), findsOneWidget);
    });

    testWidgets('shows correct bread and type for one wholemeal footlong',
        (WidgetTester tester) async {
      const widgetToBeTested = OrderItemDisplay(
        quantity: 1,
        itemType: 'footlong',
        breadType: BreadType.wholemeal,
        orderNote: 'Lots of lettuce',
      );
      const testApp = MaterialApp(
        home: Scaffold(body: widgetToBeTested),
      );
      await tester.pumpWidget(testApp);
      expect(
          find.text('1 wholemeal footlong sandwich(es): 🥪'), findsOneWidget);
      expect(find.text('Note: Lots of lettuce'), findsOneWidget);
    });
  });

  group('OrderScreen - Size Toggle Switch', () {
    testWidgets('toggles size from footlong to six-inch when Switch is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      // Initial state should show footlong
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
      
      // Tap the Switch widget to toggle
      await tester.tap(find.byType(Switch).first); // Specify the first switch
      await tester.pump();
      
      // After toggle, should show six-inch
      expect(find.text('0 white six-inch sandwich(es): '), findsOneWidget);
    });

    testWidgets('toggles size back to footlong on second tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      
      // First toggle: footlong → six-inch
      await tester.tap(find.byType(Switch).first); // Specify the first switch
      await tester.pump();
      expect(find.text('0 white six-inch sandwich(es): '), findsOneWidget);
      
      // Second toggle: six-inch → footlong
      await tester.tap(find.byType(Switch).first); // Specify the first switch
      await tester.pump();
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('preserves quantity when toggling size',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      
      // Add 3 sandwiches
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
        await tester.pump();
      }
      expect(find.text('3 white footlong sandwich(es): 🥪🥪🥪'), findsOneWidget);
      
      // Toggle size
      await tester.tap(find.byType(Switch).first); // Specify the first switch
      await tester.pump();
      
      // Quantity should remain 3, but size should change to six-inch
      expect(find.text('3 white six-inch sandwich(es): 🥪🥪🥪'), findsOneWidget);
    });

    testWidgets('preserves bread type when toggling size',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      
      // Change bread type to wheat
      await tester.tap(find.byType(DropdownMenu<BreadType>)); // Ensure DropdownButton is rendered
      await tester.pumpAndSettle();
      await tester.tap(find.text('wheat').last);
      await tester.pumpAndSettle();
      expect(find.text('0 wheat footlong sandwich(es): '), findsOneWidget);
      
      // Toggle size
      await tester.tap(find.byType(Switch).first); // Specify the first switch
      await tester.pump();
      
      // Bread type should remain wheat, size should change to six-inch
      expect(find.text('0 wheat six-inch sandwich(es): '), findsOneWidget);
    });
  });
}