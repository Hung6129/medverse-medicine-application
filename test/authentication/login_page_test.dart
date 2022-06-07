import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medverse_mobile_app/auth/login/login.dart';
import 'package:medverse_mobile_app/services/auth_service.dart';
import 'package:medverse_mobile_app/utils/providers.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockAuth extends Mock implements AuthService{}

void main() {
  Widget makeTestableWidget({Widget child, AuthService auth}) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('email or password is empty, does not sign in', (WidgetTester tester) async {
    MockAuth mockAuth = MockAuth();

    bool didSignIn = false;
    Login page = Login(onSignedIn: () => didSignIn = true);

    await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));

    await tester.ensureVisible(find.byKey(Key('SignIn')));

    verifyNever(mockAuth.loginUser());
    expect(didSignIn, false);
  });

  testWidgets('non-empty email and password, valid account, call sign in, succeed', (WidgetTester tester) async {

    MockAuth mockAuth = MockAuth();
    when(mockAuth.loginUser(email: 'email', password: 'password')).thenAnswer((invocation) => Future.value(true));

    bool didSignIn = false;
    Login page = Login(onSignedIn: () => didSignIn = true);

    await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'email');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'password');

    await tester.tap(find.byKey(Key('signIn')));

    verify(mockAuth.loginUser(email: 'email', password: 'password')).called(1);
    expect(didSignIn, true);
  });

  testWidgets('non-empty email and password, valid account, call sign in, fails', (WidgetTester tester) async {

    MockAuth mockAuth = MockAuth();
    when(mockAuth.loginUser(email: 'email', password: 'password')).thenThrow(StateError('invalid credentials'));

    bool didSignIn = false;
    Login page = Login(onSignedIn: () => didSignIn = true);

    await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'email');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'password');

    await tester.tap(find.byKey(Key('signIn')));

    verify(mockAuth.loginUser(email: 'email', password: 'password')).called(1);
    expect(didSignIn, false);
  });
}