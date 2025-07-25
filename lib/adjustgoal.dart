import 'package:flutter/material.dart';
import 'adjustgoal2.dart';

class CommitGoalScreen extends StatelessWidget {
  final String goalTitle;

  const CommitGoalScreen({Key? key, required this.goalTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C2D),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),

            Text(
              "Finally, commit to your goal\n($goalTitle)",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C3A47),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  GoalItem(
                    icon: Icons.check_circle,
                    title: "30 mins daily limit",
                    subtitle: "5 minutes sessions, 6 times daily Applies on sun, mon, tue, wed, fri, sat 12:00 AM -- 11:59 PM",
                    image: AssetImage("assets/icons8-instagram-28.png"),
                  ),
                  SizedBox(height: 16),
                  GoalItem(
                    icon: Icons.check_circle,
                    title: "5 seconds mindful pause",
                  ),
                ],
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdjustGoalTwo()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Color(0xFFB54AFF), width: 2),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Adjust Goal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GoalItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final ImageProvider? image;

  const GoalItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: subtitle != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Icon(icon, color: const Color(0xFF4AA9FF)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  if (image != null) ...[
                    const SizedBox(width: 8),
                    Image(image: image!, width: 20, height: 20),
                  ],
                ],
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
