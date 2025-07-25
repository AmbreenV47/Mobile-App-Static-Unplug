import 'package:flutter/material.dart';
import 'adjustgoal.dart'; // Import the destination screen

class ForSelectGoalPage extends StatelessWidget {
  const ForSelectGoalPage({Key? key}) : super(key: key);

  void onGoalSelected(BuildContext context, String days) {
    // Navigate to AdjustGoal screen with selected days
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommitGoalScreen(goalTitle: days),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> goals = ['30 days', '14 days', '7 days', '3 days'];

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C2D),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const SizedBox(height: 40),
            const Text(
              'Pick a streak goal to build\na lasting habit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ...goals.map(
              (goal) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                child: OutlinedButton(
                  onPressed: () => onGoalSelected(context, goal),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF9B59B6), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      goal,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
