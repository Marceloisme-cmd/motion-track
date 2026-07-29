class UserModel {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.height,
    required this.weight,
    required this.weeklyGoal,
    required this.monthlyGoal,
    required this.createdAt,
  });

  final String id;
  final String name;
  final String email;
  final double height;
  final double weight;
  final double weeklyGoal;
  final double monthlyGoal;
  final DateTime createdAt;
}
