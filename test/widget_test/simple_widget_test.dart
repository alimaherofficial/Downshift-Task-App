import 'package:coding_challenge/features/tasks/presentation/screens/main_tasks/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  // Necessary for Sizer package initialization

  testWidgets('CustomFloatingActionButton triggers onPressed when tapped',
      (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(
      Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          home: Scaffold(
            body: Sizer(
              builder: (context, orientation, deviceType) {
                return CustomFloatingActionButton(
                  onPressed: () => pressed = true,
                );
              },
            ),
          ),
        ),
      ),
    );

    // Verify button is displayed
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Tap the button and trigger a frame.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // Verify that the button's onPressed callback was triggered
    expect(pressed, true);
  });
}
