import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'aichatlayout.dart';
import 'moreinfo.dart';

class DailyScreenTime extends StatefulWidget {
  const DailyScreenTime({super.key});

  @override
  State<DailyScreenTime> createState() => _DailyScreenTimeState();
}

class _DailyScreenTimeState extends State<DailyScreenTime> {
  bool isWeekSelected = true;

  void _onToggleTap(String label) {
    setState(() => isWeekSelected = label == "Week");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E2B3C),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildToggleSwitch(),
              const SizedBox(height: 20),
              isWeekSelected ? _buildWeeklyCard() : _buildDailyCard(),
              const SizedBox(height: 20),
              _buildMostUsedCard(),
              const SizedBox(height: 100), // space for bottom nav overlaps
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
            alignment: isWeekSelected ? Alignment.centerLeft : Alignment.centerRight,
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
          const Text("Screen Time", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 10),
          const Text("This Week", style: TextStyle(color: Colors.white70, fontSize: 14)),
          const Text("14h 42m", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          LayoutBuilder(builder: (_, __) => _buildBarsSection()),
          const SizedBox(height: 16),
          const Text("Total screen time", style: TextStyle(color: Colors.white70, fontSize: 12)),
          const Text("22h 30m", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Updated today at 2:51 PM", style: TextStyle(color: Colors.white38, fontSize: 10)),
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
          const Text("Screen Time", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 10),
          const Text("Today, 12 July", style: TextStyle(color: Colors.white70, fontSize: 14)),
          const Text("2h 11m", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          LayoutBuilder(builder: (_, __) => _buildBarsSection()),
          const SizedBox(height: 16),
          const Text("Total screen time", style: TextStyle(color: Colors.white70, fontSize: 12)),
          const Text("5h 20m", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Updated today at 2:51 PM", style: TextStyle(color: Colors.white38, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildBarsSection() {
    return Column(
      children: [
        SizedBox(
          height: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBar(90, Colors.white),
              _buildBar(60, Colors.white),
              _buildBar(30, Colors.white),
              _buildBar(70, Colors.white),
              _buildBar(60, Colors.white),
              _buildBar(30, Colors.white),
              _buildBar(10, Colors.orange),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text("S", style: TextStyle(color: Colors.white)),
            Text("M", style: TextStyle(color: Colors.white)),
            Text("T", style: TextStyle(color: Colors.white)),
            Text("W", style: TextStyle(color: Colors.white)),
            Text("T", style: TextStyle(color: Colors.white)),
            Text("F", style: TextStyle(color: Colors.white)),
            Text("S", style: TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _UsageDetailWidget("3h 13m", "Social"),
            _UsageDetailWidget("1h 36m", "Entertainment"),
            _UsageDetailWidget("30m", "Creativity"),
          ],
        ),
      ],
    );
  }

  Widget _buildBar(double height, Color color) {
    return Container(
      width: 12,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
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
          const Text("Most Used", style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 16),
          _buildAppUsageRow("Instagram", isWeekSelected ? "25h" : "5h", 'assets/icons8-instagram-28.png'),
          const SizedBox(height: 12),
          _buildAppUsageRow("Facebook", isWeekSelected ? "40m" : "14m", 'assets/icons8-facebook-28.png'),
          const SizedBox(height: 12),
          _buildAppUsageRow("WhatsApp", isWeekSelected ? "19h" : "1h", 'assets/icons8-whatsapp-28.png'),
        ],
      ),
    );
  }

  Widget _buildAppUsageRow(String name, String time, String iconPath) {
    return Row(
      children: [
        Image.asset(iconPath, height: 24, width: 24),
        const SizedBox(width: 10),
        Expanded(child: Text(name, style: const TextStyle(color: Colors.white))),
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

class _UsageDetailWidget extends StatelessWidget {
  final String time;
  final String label;
  const _UsageDetailWidget(this.time, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(time, style: const TextStyle(color: Colors.white, fontSize: 10)),
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 10)),
      ],
    );
  }
}
