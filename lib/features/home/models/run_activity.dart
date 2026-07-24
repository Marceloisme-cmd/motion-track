class RunActivity {
  const RunActivity({
    required this.title,
    required this.location,
    required this.distance,
    required this.duration,
    required this.date,
    required this.pace,
    required this.notes,
  });

  final String title;
  final String location;
  final double distance;
  final Duration duration;
  final DateTime date;
  final String pace;
  final String notes;
}
