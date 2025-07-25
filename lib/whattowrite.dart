import 'package:flutter/material.dart';
import 'confirm.dart'; 

class WhatToWritePage extends StatefulWidget {
  const WhatToWritePage({Key? key}) : super(key: key);

  @override
  State<WhatToWritePage> createState() => _WhatToWritePageState();
}

class _WhatToWritePageState extends State<WhatToWritePage> {
  String selectedReminder = 'Write your own';
  String selectedTime = '5 minutes';

  final List<String> reminderOptions = [
    'Write your own',
    'Is this Important?',
    'Check this Later?',
    'Take a deep breath.',
    'Relax your shoulders',
    'Is this a good time?',
    'Wait til Monday?',
  ];

  final List<String> timeOptions = [
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '20 minutes',
    '25 minutes',
    '30 minutes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C2D),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                const Text(
                  'Daily Limit For Your Distracting App?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Reminder to help you reconsider',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 12),

                /// Reminder Dropdown
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF9B59B6),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedReminder,
                      dropdownColor: const Color(0xFF9B59B6),
                      iconEnabledColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedReminder = newValue!;
                        });
                      },
                      items: reminderOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(fontSize: 14)),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                const Text(
                  'Pause and reflect before your app opens',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                /// Time Dropdown
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white70),
                    color: Colors.transparent,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedTime,
                      dropdownColor: const Color(0xFF0B2D3B),
                      iconEnabledColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedTime = newValue!;
                        });
                      },
                      items: timeOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(fontSize: 14)),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                const SizedBox(height: 8),
                const Text(
                  'Up to 6 times per day!',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 50),

                /// Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConfirmPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9B59B6),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
