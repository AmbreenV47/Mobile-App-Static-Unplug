import 'package:flutter/material.dart';
import 'aichatlayout.dart';
import 'weeklyscreentime.dart';
import 'moreinfo.dart';

class MainScreen extends StatelessWidget {
  final List<GroupCardData> groups = [
    GroupCardData(name: "Group 1", days: "Su, M, T, W, T, F, Sa"),
    GroupCardData(name: "Group 2", days: "Su, T, T, F, Sa"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      body: SafeArea(
        child: Column(
          children: [
            // ✅ GestureDetector wrapped around visible content
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AIChatLayout()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    "💡 Unlock Lifetime Access 💡",
                    style: TextStyle(
                      color: Color(0xFFAA4FFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),

            // ✅ Group List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  return GroupCard(data: groups[index]);
                },
              ),
            ),
          ],
        ),
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D1B2A),
        selectedItemColor: const Color(0xFFAA4FFF),
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const AIChatLayout()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const WeeklyScreenTime()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MoreInfo()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-shield-28.png', height: 24),
            label: "Apps",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-chat-28.png', height: 24),
            label: "UnplugAI",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-last-24-hours-28.png', height: 24),
            label: "Screen Time",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-contact-info-28.png', height: 24),
            label: "More",
          ),
        ],
      ),
    );
  }
}

class GroupCardData {
  final String name;
  final String days;
  final List<String> icons;

  GroupCardData({
    required this.name,
    required this.days,
    this.icons = const ["facebook", "instagram", "whatsapp"],
  });
}

class GroupCard extends StatelessWidget {
  final GroupCardData data;

  const GroupCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1B263B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name & Days Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.days,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Icons Row
            Row(
              children: data.icons.map((icon) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Image.asset(
                    'assets/icons8-instagram-28.png',
                    width: 24,
                    height: 24,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),

            // Streak
            const Text(
              "Streak day 1",
              style: TextStyle(
                color: Color(0xFFAA4FFF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
