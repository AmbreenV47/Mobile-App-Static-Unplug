import 'package:flutter/material.dart';
import 'dailylimit.dart'; 

class AllTheTimePage extends StatelessWidget {
  const AllTheTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F24),
      body: SafeArea(
        child: Column(
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

            const SizedBox(height: 30),

            /// Selected Button (All The Time)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: OutlinedButton(
                onPressed: () {
                  // Already selected
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.purple, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "All The Time",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Spacer(),

            /// Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: ElevatedButton(
                onPressed: () {
                  // ✅ Navigate to DailyLimitPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DailyLimitPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
