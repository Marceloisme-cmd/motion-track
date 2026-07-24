import '../models/run_activity.dart';

final dummyActivities = [
  RunActivity(
    title: "Morning Run",
    location: "Bogor Botanical Garden, Bogor Kota",
    distance: 5.2,
    duration: const Duration(minutes: 32),
    date: DateTime(2026, 7, 20),
    pace: "6'12\"",
    notes:
        "Easy morning run before work.Felt relaxed and maintained a comfortable pace throughout the session.",
  ),

  RunActivity(
    title: "Recovery Run",
    location: "Sempur, Bogor Kota",
    distance: 3.8,
    duration: const Duration(minutes: 25),
    date: DateTime(2026, 7, 19),
    pace: "6'35\"",
    notes:
        "Recovery run after yesterday's long run.Legs felt slightly sore at the beginning but improved after a few kilometers.",
  ),

  RunActivity(
    title: "Long run",
    location: "Lapangan Sempur, Bogor Kota",
    distance: 7.4,
    duration: const Duration(minutes: 48),
    date: DateTime(2026, 7, 18),
    pace: "6'28\"",
    notes:
        "Weekend long run with consistent pacing.Stayed hydrated and finished feeling confident for the next training session.",
  ),
];
