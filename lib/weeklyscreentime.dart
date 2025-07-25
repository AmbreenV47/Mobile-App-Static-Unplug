import 'package:flutter/material.dart';
import 'aichatlayout.dart';
import 'mainscreen.dart';
import 'moreinfo.dart';

class WeeklyScreenTime extends StatefulWidget {
  const WeeklyScreenTime({super.key});

  @override
  State<WeeklyScreenTime> createState() => _WeeklyScreenTimeState();
}

class _WeeklyScreenTimeState extends State<WeeklyScreenTime> {
  bool isWeekSelected = true;

  void _onToggleTap(String label) {
    setState(() {
      isWeekSelected = label == "Week";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E2B3C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildToggleSwitch(),
              const SizedBox(height: 20),
              Flexible(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 100),
                  children: [
                    isWeekSelected ? _buildWeeklyCard() : _buildDailyCard(),
                    const SizedBox(height: 20),
                    _buildMostUsedCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildToggleSwitch() {
    return Container(
      width: 220,
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFF092231),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white24),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            alignment:
                isWeekSelected ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: 110,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFF9B59B6),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _onToggleTap("Week"),
                  child: Center(
                    child: Text(
                      'Week',
                      style: TextStyle(
                        color: isWeekSelected ? Colors.white : Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => _onToggleTap("Day"),
                  child: Center(
                    child: Text(
                      'Day',
                      style: TextStyle(
                        color: isWeekSelected ? Colors.white70 : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF092231),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Screen Time (Weekly)",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 10),
          const Text("Week: 6 - 12 July",
              style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 20),
          _buildWeeklyBarsSection(),
          const SizedBox(height: 16),
          const Text("Total screen time",
              style: TextStyle(color: Colors.white70, fontSize: 12)),
          const Text("18h 45m",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Updated today at 2:51 PM",
              style: TextStyle(color: Colors.white38, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildWeeklyBarsSection() {
    return SizedBox(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildWeeklyBar("S", 80, "3h 10m", Colors.white),
          _buildWeeklyBar("M", 60, "2h 40m", Colors.white),
          _buildWeeklyBar("T", 70, "2h 50m", Colors.white),
          _buildWeeklyBar("W", 50, "1h 40m", Colors.white),
          _buildWeeklyBar("T", 30, "4h", Colors.white),
          _buildWeeklyBar("F", 85, "3h", Colors.white),
          _buildWeeklyBar("S", 40, "1h", Colors.orange),
        ],
      ),
    );
  }

  Widget _buildDailyCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF092231),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Screen Time (Daily)",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 10),
          const Text("Today, 12 July",
              style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 10),
          const Text("2h 11m",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildDailyBarsSection(),
          const SizedBox(height: 8),
          const Text("Updated today at 2:51 PM",
              style: TextStyle(color: Colors.white38, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildDailyBarsSection() {
    return SizedBox(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildWeeklyBar("6 AM", 30, "20m", Colors.white70),
          _buildWeeklyBar("9 AM", 50, "40m", Colors.white70),
          _buildWeeklyBar("12 PM", 30, "1h 30m", Colors.white),
          _buildWeeklyBar("3 PM", 80, "1h 10m", Colors.white),
          _buildWeeklyBar("6 PM", 60, "50m", Colors.white),
          _buildWeeklyBar("9 PM", 40, "30m", Colors.orange),
        ],
      ),
    );
  }

  Widget _buildWeeklyBar(
      String label, double height, String time, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 4),
        Container(
          width: 12,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(time, style: const TextStyle(color: Colors.white70, fontSize: 10)),
      ],
    );
  }

  Widget _buildMostUsedCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF092231),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Most Used",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 16),
          _buildAppUsageRow(
              "Instagram", isWeekSelected ? "25h" : "5h", 'assets/icons8-instagram-28.png'),
          const SizedBox(height: 12),
          _buildAppUsageRow(
              "Facebook", isWeekSelected ? "40m" : "14m", 'assets/icons8-facebook-28.png'),
          const SizedBox(height: 12),
          _buildAppUsageRow(
              "WhatsApp", isWeekSelected ? "19h" : "1h", 'assets/icons8-whatsapp-28.png'),
        ],
      ),
    );
  }

  Widget _buildAppUsageRow(String name, String time, String iconPath) {
    return Row(
      children: [
        Image.asset(iconPath, height: 24),
        const SizedBox(width: 10),
        Expanded(
          child: Text(name, style: const TextStyle(color: Colors.white)),
        ),
        Text(time, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }

 Widget _buildBottomNavBar() {
  return BottomNavigationBar(
    backgroundColor: const Color(0xFF0D1B2A),
    type: BottomNavigationBarType.fixed,
    currentIndex: 2,
    showUnselectedLabels: true,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white70,
    onTap: (index) {
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MainScreen()),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AIChatLayout()),
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
        icon: Image.asset(
          'assets/icons8-shield-28.png',
          height: 24,
          width: 24,
        ),
        label: 'Apps',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons8-chat-28.png',
          height: 24,
          width: 24,
        ),
        label: 'UnplugAI',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons8-last-24-hours-28.png',
          height: 24,
          width: 24,
        ),
        label: 'Screen Time',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons8-contact-info-28.png',
          height: 24,
          width: 24,
        ),
        label: 'More',
      ),
    ],
  );
}

}
