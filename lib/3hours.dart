import 'package:flutter/material.dart';
import 'whattowrite.dart'; 

class ThreeHoursPage extends StatefulWidget {
  const ThreeHoursPage({super.key});

  @override
  State<ThreeHoursPage> createState() => _ThreeHoursPageState();
}

class _ThreeHoursPageState extends State<ThreeHoursPage> {
  final List<String> timeOptions = [
    '1 minute',
    '2 minutes',
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '30 minutes'
  ];

  String selectedTime = '5 minutes';

  void _showTimePickerDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1F38),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: timeOptions.length,
          itemBuilder: (context, index) {
            final option = timeOptions[index];
            return ListTile(
              title: Text(
                option,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  selectedTime = option;
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F24),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Daily Limit For Your Distracting App?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tracked between 12:00 AM - 11:59PM',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.purple, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  '3 Hours',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Use each app for',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const SizedBox(height: 10),

              OutlinedButton(
                onPressed: _showTimePickerDialog,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.purple, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedTime,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Up to 6 times per day!',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const Spacer(),

              /// ✅ Continue Button with Navigation
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WhatToWritePage(),
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
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
