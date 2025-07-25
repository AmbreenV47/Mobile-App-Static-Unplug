import 'package:flutter/material.dart';
import 'allthetime.dart';
import 'workdays.dart';
import 'weeknights.dart';
import 'mornings.dart';
import 'specifictime.dart'; 

class SelectTimePage extends StatelessWidget {
  const SelectTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F24),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            const SizedBox(height: 40),

            /// Title
            const Text(
              "When to reduce app screentime?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 40),

            /// Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  buildOptionButton(context, "All The Time"),
                  buildOptionButton(context, "Work Days"),
                  buildOptionButton(context, "Week Nights"),
                  buildOptionButton(context, "Mornings"),
                  buildOptionButton(context, "Specific Time Range"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: OutlinedButton(
        onPressed: () {
          if (label == "All The Time") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AllTheTimePage()),
            );
          } else if (label == "Work Days") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SpecificTimePage()),
            );
          } else if (label == "Week Nights") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WeekNightsPage()),
            );
          } else if (label == "Mornings") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MorningsPage()),
            );
          } else if (label == "Specific Time Range") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SpecificTimeePage()),
            );
          } else {
            print("Selected: $label");
          }
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.purple, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
