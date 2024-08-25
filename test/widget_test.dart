import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rider_app/providers/authenticationProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });
  test('register with mock API', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final authNotifier = container.read(authProvider.notifier);
    await authNotifier.register(
        'test@example.com', '0780640237', 'password123', 'emmanuel');

    expect(container.read(authProvider).isAuthenticated, true);
  });

  test('login with mock API (success)', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final authNotifier = container.read(authProvider.notifier);
    await authNotifier.login('test@example.com', 'password123');

    expect(container.read(authProvider).isAuthenticated, true);
  });

  test('login with mock API (failure)', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final authNotifier = container.read(authProvider.notifier);
    await authNotifier.login('wrong@example.com', 'wrongpassword');
    expect(container.read(authProvider).isAuthenticated, false);
    expect(container.read(authProvider).errorMessage, "Invalid credentials");
  });
}
