import 'package:flutter/material.dart';
import 'aichatlayout.dart';
import 'mainscreen.dart';
import 'weeklyscreentime.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E2B3C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCard([
                _buildListItem("More Tools"),
                _buildDivider(),
                _buildListItem("Digital Declutter Tips"),
              ]),
              const SizedBox(height: 20),
              _buildCard([
                _buildSectionTitle("Support"),
                _buildDivider(),
                _buildListItem("Show FAQ"),
                _buildListItem("Share Unplug"),
                _buildListItem("Purchase Unlimited Access"),
                _buildListItem("Purchase Details"),
              ]),
              const Spacer(),
              Column(
                children: const [
                  Text("No Data saved", style: TextStyle(color: Colors.white54, fontSize: 12)),
                  Text("Privacy Policy", style: TextStyle(color: Colors.white54, fontSize: 12)),
                  SizedBox(height: 10),
                  Text("Unplug ⓒ All rights reserved", style: TextStyle(color: Colors.white60, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0D1B2A),
      type: BottomNavigationBarType.fixed,
      currentIndex: 3,
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
        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const WeeklyScreenTime()),
          );
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons8-shield-28.png', height: 24, width: 24),
          label: 'Apps',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons8-chat-28.png', height: 24, width: 24),
          label: 'UnplugAI',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons8-last-24-hours-28.png', height: 24, width: 24),
          label: 'Screen Time',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons8-contact-info-28.png', height: 24, width: 24),
          label: 'More',
        ),
      ],
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF092231),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildListItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(color: Colors.white24, thickness: 0.5, indent: 16, endIndent: 16);
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}
