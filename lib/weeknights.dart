import 'package:flutter/material.dart';
import 'dailylimit.dart'; 

class WeekNightsPage extends StatefulWidget {
  const WeekNightsPage({super.key});

  @override
  State<WeekNightsPage> createState() => _WeekNightsPageState();
}

class _WeekNightsPageState extends State<WeekNightsPage> {
  TimeOfDay _startTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 23, minute: 59);
  final List<String> _days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  final Set<int> _selectedDays = {};

  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final initialTime = isStart ? _startTime : _endTime;
    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            timePickerTheme: const TimePickerThemeData(
              backgroundColor: Color(0xFF1C1C2D),
              hourMinuteTextColor: Colors.white,
              dialHandColor: Colors.purple,
              dialBackgroundColor: Color(0xFF2A2A3D),
              dayPeriodTextColor: Colors.white70,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  Widget buildDayChip(int index) {
    final isSelected = _selectedDays.contains(index);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedDays.remove(index);
          } else {
            _selectedDays.add(index);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.purple),
          color: isSelected ? Colors.purple : Colors.transparent,
        ),
        child: Text(
          _days[index],
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F24),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            /// Title
            const Text(
              "When to reduce app screentime?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 24),

            /// Selected Option
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.purple, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  "Specific Time Range",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Time & Days Container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1F38),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  /// Start & End Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Start Time:", style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () => _selectTime(context, true),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: Text(formatTime(_startTime), style: const TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("End Time:", style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () => _selectTime(context, false),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        child: Text(formatTime(_endTime), style: const TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// Days of Week
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_days.length, (i) => buildDayChip(i)),
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: ElevatedButton(
                onPressed: () {
                  print("Start: ${formatTime(_startTime)}");
                  print("End: ${formatTime(_endTime)}");
                  print("Days: $_selectedDays");

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
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
