import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'weeklyscreentime.dart';
import 'moreinfo.dart';

class AIChatLayout extends StatelessWidget {
  const AIChatLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF0E2B3C),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Welcome! To Un',
                                  style: TextStyle(color: Colors.white)),
                              TextSpan(
                                  text: 'plug\n',
                                  style: TextStyle(color: Color(0xFF9B59B6))),
                              TextSpan(
                                  text: 'Ambreen',
                                  style: TextStyle(color: Color(0xFFE84393))),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.2),
                          hintText: 'Ask or say something here',
                          hintStyle: const TextStyle(color: Colors.white70),
                          suffixIcon: const Icon(Icons.send,
                              color: Colors.cyanAccent),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),

      // ✅ Bottom Nav with PNG icons and FULL navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0E2B3C),
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // AIChatLayout tab selected
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MainScreen()),
            );
          } else if (index == 1) {
            // Already here: AIChatLayout
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => WeeklyScreenTime()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MoreInfo()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-shield-28.png', height: 24),
            label: 'Apps',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-chat-28.png', height: 24),
            label: 'UnplugAI',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-last-24-hours-28.png', height: 24),
            label: 'Screen Time',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-contact-info-28.png', height: 24),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
