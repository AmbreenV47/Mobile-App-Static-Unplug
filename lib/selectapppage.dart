import 'package:flutter/material.dart';
import 'selecttimepage.dart'; 

class SelectAppPage extends StatefulWidget {
  const SelectAppPage({super.key});

  @override
  State<SelectAppPage> createState() => _SelectAppPageState();
}

class _SelectAppPageState extends State<SelectAppPage> {
  final Map<String, List<String>> categories = {
    "Social": ["Instagram", "Facebook", "WhatsApp"],
    "Games": ["Clash of Clans", "PUBG", "Fortnite"],
    "Entertainment": ["YouTube", "Netflix", "Spotify"],
    "Creativity": ["Pinterest", "Canva", "Notion"]
  };

  final Map<String, bool> isExpanded = {};
  final Map<String, Set<String>> selectedApps = {};

  @override
  void initState() {
    super.initState();
    for (var category in categories.keys) {
      isExpanded[category] = false;
      selectedApps[category] = {};
    }
  }

  bool get anyAppSelected =>
      selectedApps.values.any((apps) => apps.isNotEmpty);

  void toggleCategorySelection(String category) {
    final apps = categories[category]!;
    final allSelected = selectedApps[category]!.length == apps.length;

    setState(() {
      if (allSelected) {
        selectedApps[category]!.clear();
      } else {
        selectedApps[category] = apps.toSet();
      }
    });
  }

  void toggleAppSelection(String category, String app) {
    setState(() {
      if (selectedApps[category]!.contains(app)) {
        selectedApps[category]!.remove(app);
      } else {
        selectedApps[category]!.add(app);
      }
    });
  }

  void showValidationPopup() {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "No Apps Selected",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please select your distracting apps to continue",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text("Select Apps"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryTile(String category) {
    final isOpen = isExpanded[category]!;
    final apps = categories[category]!;
    final isAllSelected = selectedApps[category]!.length == apps.length;

    final iconFile = 'assets/icons/category/${category.toLowerCase()}.png';

    return Column(
      children: [
        ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          tileColor: Colors.grey.shade800,
          leading: Icon(
            isAllSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: isAllSelected ? Colors.blue : Colors.white,
          ),
          title: Row(
            children: [
              Image.asset(iconFile, height: 24, width: 24),
              const SizedBox(width: 8),
              Text(category,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          trailing: Icon(
            isOpen ? Icons.expand_less : Icons.arrow_forward_ios,
            size: 18,
            color: Colors.white,
          ),
          onTap: () {
            setState(() {
              isExpanded[category] = !isExpanded[category]!;
            });
          },
          onLongPress: () => toggleCategorySelection(category),
        ),
        if (isOpen)
          ...apps.map((app) => ListTile(
                leading: Icon(
                  selectedApps[category]!.contains(app)
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: selectedApps[category]!.contains(app)
                      ? Colors.blue
                      : Colors.white,
                ),
                title: Row(
                  children: [
                    Image.asset(
                      'assets/icons/apps/${app.toLowerCase().replaceAll(' ', '').replaceAll('ofclans', 'ofclans')}.png',
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(app, style: const TextStyle(color: Colors.white)),
                  ],
                ),
                onTap: () => toggleAppSelection(category, app),
              )),
        const SizedBox(height: 6),
      ],
    );
  }

  void goToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SelectTimePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F24),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              "Start with up to 5\ndistracting apps",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Selected apps will hide notifications",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),

            /// Categories Box
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children:
                    categories.keys.map((c) => buildCategoryTile(c)).toList(),
              ),
            ),

            const Spacer(),

            /// Select Apps Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: ElevatedButton(
                onPressed: () {
                  if (!anyAppSelected) {
                    showValidationPopup();
                  } else {
                    goToNextScreen();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  "Select Apps",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
