import 'package:flutter/material.dart';
import 'selecttimepage.dart';

class SelectDistractionAppsPage extends StatefulWidget {
  const SelectDistractionAppsPage({super.key});

  @override
  State<SelectDistractionAppsPage> createState() => _SelectDistractionAppsPageState();
}

class _SelectDistractionAppsPageState extends State<SelectDistractionAppsPage> {
  final List<String> categories = ['Social', 'Games', 'Entertainment', 'Creativity'];
  final List<String> apps = ['Instagram', 'Facebook', 'WhatsApp'];

  final Map<String, String> categoryIcons = {
    'Social': 'assets/icons8-social-40.png',
    'Games': 'assets/icons8-games-30.png',
    'Entertainment': 'assets/icons8-entertainment-30.png',
    'Creativity': 'assets/icons8-creativity-30.png',
  };

  final Map<String, String> appIcons = {
    'Instagram': 'assets/icons8-instagram-28.png',
    'Facebook': 'assets/icons8-facebook-28.png',
    'WhatsApp': 'assets/icons8-whatsapp-28.png',
  };

  Map<String, bool> expanded = {};
  Map<String, Map<String, bool>> selections = {};

  @override
  void initState() {
    super.initState();
    for (var category in categories) {
      expanded[category] = false;
      selections[category] = {for (var app in apps) app: false};
    }
  }

  bool allSelected(String category) {
    return selections[category]!.values.every((v) => v);
  }

  void toggleAll(String category, bool value) {
    setState(() {
      selections[category]!.updateAll((key, _) => value);
    });
  }

  void toggleSingle(String category, String app, bool value) {
    setState(() {
      selections[category]![app] = value;
    });
  }

  void showNoAppSelectedModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF000000),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "No Apps Selected",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                "Please select your distracting apps to continue",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text("Please Select Apps", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062A40),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Start with up to 5 distracting apps",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                "Selected apps will hide notifications",
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 20),

              // Scrollable category cards
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: categories.map((category) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF2F3E50),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    expanded[category] = !(expanded[category]!);
                                  });
                                },
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: allSelected(category),
                                      onChanged: (value) {
                                        toggleAll(category, value!);
                                      },
                                      activeColor: Colors.purple,
                                    ),
                                    Image.asset(categoryIcons[category]!, height: 24),
                                    const SizedBox(width: 8),
                                    Text(
                                      category,
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      expanded[category]! ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              if (expanded[category]!)
                                Column(
                                  children: apps.map((app) {
                                    return Row(
                                      children: [
                                        Checkbox(
                                          value: selections[category]![app],
                                          onChanged: (value) {
                                            toggleSingle(category, app, value!);
                                          },
                                          activeColor: Colors.purple,
                                        ),
                                        Image.asset(appIcons[app]!, height: 24),
                                        const SizedBox(width: 8),
                                        Text(app, style: const TextStyle(color: Colors.white)),
                                      ],
                                    );
                                  }).toList(),
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final selectedApps = <String>[];
                    selections.forEach((category, appMap) {
                      appMap.forEach((app, isSelected) {
                        if (isSelected) selectedApps.add(app);
                      });
                    });

                    if (selectedApps.isEmpty) {
                      showNoAppSelectedModal();
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SelectTimePage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Select Apps",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
