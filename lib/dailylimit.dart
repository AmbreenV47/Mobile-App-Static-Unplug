import 'package:flutter/material.dart';
import '3hours.dart';
import '2hours.dart';
import '1hour.dart';
import '30min.dart';

class DailyLimitPage extends StatelessWidget {
  const DailyLimitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F24),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),


              const SizedBox(height: 30),

              /// Title
              const Text(
                'Daily Limit For Your Distracting App?',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              /// Subtext
              const Text(
                'Tracked between 12:00 AM - 11:59PM',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 40),

              /// Option Buttons
              buildOptionButton(context, '3 Hours'),
              buildOptionButton(context, '2 Hours'),
              buildOptionButton(context, '1 Hour'),
              buildOptionButton(context, '30 Minutes'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOptionButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: OutlinedButton(
        onPressed: () {
          if (label == '3 Hours') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThreeHoursPage()),
            );
          } else if (label == '2 Hours') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TwoHoursPage()),
            );
          } else if (label == '1 Hour') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OneHoursPage()),
            );
          } else if (label == '30 Minutes') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirtyMinPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Selected: $label'),
                duration: const Duration(seconds: 1),
              ),
            );
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
