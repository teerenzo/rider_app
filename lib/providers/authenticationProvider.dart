import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationState {
  final bool? isAuthenticated;
  final String? errorMessage;
  final bool? isLoading;
  final String? email;
  final String? phone;
  final String? name;

  AuthenticationState(
      {this.isAuthenticated,
      this.errorMessage,
      this.isLoading,
      this.email,
      this.phone,
      this.name});
  // copyWith method to update the state
  AuthenticationState copyWith(
      {bool? isAuthenticated,
      String? errorMessage,
      bool? isLoading,
      String? email,
      String? phone,
      String? name}) {
    return AuthenticationState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
    );
  }
}

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier({required this.ref})
      : super(AuthenticationState(isAuthenticated: false));

  final Ref ref;

  Future<void> register(
    String email,
    String phone,
    String gender,
    String name,
  ) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      await Future.delayed(Duration(seconds: 4));

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('name', name);
      await prefs.setString('phone', phone);
      await prefs.setString('gender', gender);

      final savedEmail = prefs.getString('email');
      if (savedEmail != null) {
        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
          email: email,
          phone: phone,
        );
      } else {
        throw Exception("Failed to save user data.");
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isAuthenticated: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true);
      final prefs = await SharedPreferences.getInstance();
      final storedEmail = prefs.getString('email');
      final storedPassword = prefs.getString('password');

      state = state.copyWith(isLoading: false);
      if (storedEmail == email && storedPassword == password) {
        state = AuthenticationState(isAuthenticated: true);
        return true;
      } else {
        state = AuthenticationState(
            isAuthenticated: false, errorMessage: 'Invalid credentials');
        return false;
      }
    } catch (e) {
      state = AuthenticationState(
          isAuthenticated: false, errorMessage: e.toString());
      return false;
    }
  }

  // create password
  Future<void> createPassword(String password) async {
    state = state.copyWith(isLoading: true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password);
    state = state.copyWith(isLoading: false);
  }

// logout user
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.remove('phone');
  }
}

final authProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
  return AuthenticationNotifier(ref: ref);
});
