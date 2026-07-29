import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motiontrack/models/user_model.dart';

class UserRepository {
  UserRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<void> createUser({required UserModel user}) async {
    await _firestore.collection('users').doc(user.id).set({
      'name': user.name,
      'email': user.email,
      'height': user.height,
      'weight': user.weight,
      'weeklyGoal': user.weeklyGoal,
      'monthlyGoal': user.monthlyGoal,
      'createdAt': user.createdAt,
    });
  }
}
