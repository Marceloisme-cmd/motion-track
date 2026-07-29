import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motiontrack/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motiontrack/data/repositories/user_repository.dart';
import 'package:motiontrack/providers/user_provider.dart';
import '../models/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthNotifier extends StateNotifier<AsyncValue<void>> {
  AuthNotifier(this._authRepository, this._userRepository)
    : super(const AsyncData(null));

  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      final userCredential = await _authRepository.register(
        name: name,
        email: email,
        password: password,
      );

      final user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        height: 0,
        weight: 0,
        weeklyGoal: 20,
        monthlyGoal: 80,
        createdAt: DateTime.now(),
      );
      await _userRepository.createUser(user: user);

      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    try {
      await _authRepository.signIn(email: email, password: password);

      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<void>>((
  ref,
) {
  final authRepository = ref.watch(authRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);

  return AuthNotifier(authRepository, userRepository);
});

final authStateProvider = StreamProvider<User?>((ref) {
  final repository = ref.watch(authRepositoryProvider);

  return repository.authStateChanges();
});
