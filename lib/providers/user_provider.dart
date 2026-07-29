import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motiontrack/data/repositories/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});
