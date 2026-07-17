import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

class MotionTrackApp extends StatelessWidget {
  const MotionTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotionTrack',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text('MotionTrack')),
        body: const Center(child: Text('MotionTrack')),
      ),
      // router
    );
  }
}
