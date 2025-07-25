import 'package:flutter/material.dart';
import 'alldonepopup.dart';
import 'package:intl/intl.dart';

class AdjustGoalTwo extends StatefulWidget {
  @override
  _AdjustGoalTwoState createState() => _AdjustGoalTwoState();
}

class _AdjustGoalTwoState extends State<AdjustGoalTwo> {
  String? beforeOpening, pauseFor, withMessage, openEachApp, forGoal;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<Map<String, dynamic>> appOptions = [
    {'label': 'Instagram', 'icon': 'assets/icons8-instagram-28.png'},
    {'label': 'WhatsApp', 'icon': 'assets/icons8-whatsapp-28.png'},
    {'label': 'Facebook', 'icon': 'assets/icons8-facebook-28.png'},
  ];

  final List<String> pauseOptions = ['60 minutes', '30 minutes', '15 mins'];
  final List<String> messageOptions = [
    'Write your own',
    'Is this Important?',
    'Check this Later?',
    'Take a deep breath.',
    'Relax your shoulders',
    'Is this a good time?',
    'Wait til Monday?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Adjust Goal', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildAppDropdown("Before opening", beforeOpening, (val) {
              setState(() => beforeOpening = val);
            }),
            _buildDropdownSection("Pause for", pauseFor, pauseOptions, (val) {
              setState(() => pauseFor = val);
            }),
            _buildDropdownSection(
              "With the message",
              withMessage,
              messageOptions,
              (val) {
                setState(() => withMessage = val);
              },
            ),
            const SizedBox(height: 20),
            _buildExpansionTile(
              title: "📊 Daily Goal",
              children: [
                _buildDropdownSection(
                  "Open each app",
                  openEachApp,
                  pauseOptions,
                  (val) {
                    setState(() => openEachApp = val);
                  },
                ),
                _buildDropdownSection("For", forGoal, pauseOptions, (val) {
                  setState(() => forGoal = val);
                }),
              ],
            ),
            const SizedBox(height: 10),
            _buildExpansionTile(
              title: "📅 Schedule",
              children: [
                ListTile(
                  title: Text(
                    selectedDate != null
                        ? 'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}'
                        : 'Pick a Date',
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(Icons.calendar_today, color: Colors.white),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                      builder: (context, child) =>
                          Theme(data: ThemeData.dark(), child: child!),
                    );
                    if (picked != null) {
                      setState(() => selectedDate = picked);
                    }
                  },
                ),
                ListTile(
                  title: Text(
                    selectedTime != null
                        ? 'Selected Time: ${selectedTime!.format(context)}'
                        : 'Pick a Time',
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(Icons.access_time, color: Colors.white),
                  onTap: () async {
                    TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (context, child) =>
                          Theme(data: ThemeData.dark(), child: child!),
                    );
                    if (picked != null) {
                      setState(() => selectedTime = picked);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllDonePopup()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAA4FFF),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownSection(
    String title,
    String? value,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1B263B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: const Color(0xFF1B263B),
                value: value,
                hint: const Text(
                  "Select",
                  style: TextStyle(color: Colors.white54),
                ),
                iconEnabledColor: Colors.white70,
                items: options
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppDropdown(
    String title,
    String? value,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title + (value != null ? " (1 app selected)" : ""),
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1B263B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                hint: const Text(
                  "Select",
                  style: TextStyle(color: Colors.white54),
                ),
                dropdownColor: const Color(0xFF1B263B),
                iconEnabledColor: Colors.white70,
                items: appOptions
                    .map(
                      (app) => DropdownMenuItem<String>(
                        value: app['label'],
                        child: Row(
                          children: [
                            Image.asset(app['icon'], height: 24, width: 24),
                            const SizedBox(width: 10),
                            Text(
                              app['label'],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1B263B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          unselectedWidgetColor: Colors.white70,
          colorScheme: const ColorScheme.dark(),
        ),
        child: ExpansionTile(
          title: Text(title, style: const TextStyle(color: Colors.white)),
          children: children,
        ),
      ),
    );
  }
}
