import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sheet/route.dart';

import '../../helpers.dart';

void main() {
  group('MaterialExtendedPageRoute', () {
    testWidgets('renders', (WidgetTester tester) async {
      await tester.pumpApp(SizedBox());

      await Navigator.of(tester.contextForRootNavigator).push(
        MaterialExtendedPageRoute(builder: (context) => Text('child')),
      );
      await tester.pumpAndSettle();
      expect(find.text('child'), findsOneWidget);
    });

    test('is a PreviousSheetRouteMixin', () {
      expect(
        MaterialExtendedPageRoute(builder: (context) => Text('child')),
        isA<PreviousSheetRouteMixin<dynamic>>(),
      );
    });

    test('is a DelegatedTransitionsRoute', () {
      expect(
        MaterialExtendedPageRoute(builder: (context) => Text('child')),
        isA<DelegatedTransitionsRoute<dynamic>>(),
      );
    });

    test('is a MaterialPageRoute', () {
      expect(
        MaterialExtendedPageRoute(builder: (context) => Text('child')),
        isA<MaterialPageRoute<dynamic>>(),
      );
    });
  });

  group('MaterialExtendedPage', () {
    testWidgets('renders', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) {
          return Navigator(
            pages: [
              MaterialExtendedPage(child: Text('child')),
            ],
            onDidRemovePage: (_) {},
          );
        },
      ));
      await tester.pumpAndSettle();
      expect(find.text('child'), findsOneWidget);
    });

    testWidgets('navigating to different routes keeping the same page', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) {
          return Navigator(
            pages: [
              MaterialExtendedPage(child: Text('first child')),
            ],
            onDidRemovePage: (_) {},
          );
        },
      ));
      await tester.pumpAndSettle();
      expect(find.text('first child'), findsOneWidget);

      await tester.pumpWidget(MaterialApp(
        builder: (context, child) {
          return Navigator(
            pages: [
              MaterialExtendedPage(child: Text('second child')),
            ],
            onDidRemovePage: (_) {},
          );
        },
      ));

      await tester.pumpAndSettle();
      expect(find.text('second child'), findsOneWidget);
    });

    testWidgets('route is a MaterialExtendedPageRoute', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) {
          return Navigator(
            pages: [MaterialPage(child: SizedBox())],
            onDidRemovePage: (_) {},
          );
        },
      ));
      expect(
        MaterialExtendedPage(child: Text('child')).createRoute(tester.contextForRootNavigator),
        isA<MaterialExtendedPageRoute<dynamic>>(),
      );
    });

    testWidgets('params are passed to route', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) {
          return Navigator(
            pages: [MaterialPage(child: SizedBox())],
            onDidRemovePage: (_) {},
          );
        },
      ));
      final page = MaterialExtendedPage(
        child: Text('child'),
        fullscreenDialog: true,
        maintainState: false,
      );
      expect(
        page.createRoute(tester.contextForRootNavigator),
        isA<MaterialExtendedPageRoute<dynamic>>()
            .having(
              (p) => p.fullscreenDialog,
              'fullscreenDialog',
              isTrue,
            )
            .having(
              (p) => p.settings,
              'settings',
              page,
            )
            .having(
              (p) => p.maintainState,
              'maintainState',
              isFalse,
            ),
      );
    });
  });
  group('CupertinoExtendedPageRoute', () {
    testWidgets('renders', (WidgetTester tester) async {
      await tester.pumpApp(SizedBox());

      await Navigator.of(tester.contextForRootNavigator).push(
        CupertinoExtendedPageRoute(builder: (context) => Text('child')),
      );
      await tester.pumpAndSettle();
      expect(find.text('child'), findsOneWidget);
    });

    test('is a PreviousSheetRouteMixin', () {
      expect(
        CupertinoExtendedPageRoute(builder: (context) => Text('child')),
        isA<PreviousSheetRouteMixin<dynamic>>(),
      );
    });

    test('is a DelegatedTransitionsRoute', () {
      expect(
        CupertinoExtendedPageRoute(builder: (context) => Text('child')),
        isA<DelegatedTransitionsRoute<dynamic>>(),
      );
    });

    test('is a CupertinoPageRoute', () {
      expect(
        CupertinoExtendedPageRoute(builder: (context) => Text('child')),
        isA<CupertinoPageRoute<dynamic>>(),
      );
    });
  });

  group('CupertinoExtendedPage', () {
    testWidgets('renders', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) {
          return Navigator(
            pages: [
              CupertinoExtendedPage(child: Text('child')),
            ],
            onDidRemovePage: (_) {},
          );
        },
      ));
      await tester.pumpAndSettle();
      expect(find.text('child'), findsOneWidget);
    });

    testWidgets('navigating to different routes keeping the same page', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) {
          return Navigator(
            pages: [
              CupertinoExtendedPage(child: Text('first child')),
            ],
            onDidRemovePage: (_) {},
          );
        },
      ));
      await tester.pumpAndSettle();
      expect(find.text('first child'), findsOneWidget);

      await tester.pumpWidget(MaterialApp(
        builder: (context, child) {
          return Navigator(
            pages: [
              CupertinoExtendedPage(child: Text('second child')),
            ],
            onDidRemovePage: (_) {},
          );
        },
      ));

      await tester.pumpAndSettle();
      expect(find.text('second child'), findsOneWidget);
    });

    testWidgets('route is a CupertinoExtendedPageRoute', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) {
          return Navigator(
            pages: [MaterialPage(child: SizedBox())],
            onDidRemovePage: (_) {},
          );
        },
      ));
      expect(
        CupertinoExtendedPage(child: Text('child')).createRoute(tester.contextForRootNavigator),
        isA<CupertinoExtendedPageRoute<dynamic>>(),
      );
    });

    testWidgets('params are passed to route', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        builder: (context, child) {
          return Navigator(
            pages: [MaterialPage(child: SizedBox())],
            onDidRemovePage: (_) {},
          );
        },
      ));
      final page = CupertinoExtendedPage(
        child: Text('child'),
        title: 'Title',
        fullscreenDialog: true,
        maintainState: false,
      );
      expect(
        page.createRoute(tester.contextForRootNavigator),
        isA<CupertinoExtendedPageRoute<dynamic>>()
            .having(
              (p) => p.fullscreenDialog,
              'fullscreenDialog',
              isTrue,
            )
            .having(
              (p) => p.settings,
              'settings',
              page,
            )
            .having(
              (p) => p.maintainState,
              'maintainState',
              isFalse,
            )
            .having(
              (p) => p.title,
              'title',
              equals('Title'),
            ),
      );
    });
  });
}
