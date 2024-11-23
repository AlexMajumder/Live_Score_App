import 'package:flutter/material.dart';
import 'package:live_score_app/screen/live_score_screen.dart';

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LiveScoreScreen(),
    );
  }
}
