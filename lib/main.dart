import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slider',
      debugShowCheckedModeBanner: false,
      home: const OnboardingSlider(),
    );
  }
}

class OnboardingSlider extends StatefulWidget {
  const OnboardingSlider({super.key});

  @override
  State<OnboardingSlider> createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    OnboardingPage(
      title: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(color: Colors.white, fontSize: 16),
          children: [
            TextSpan(text: 'UNP'),
            TextSpan(
              text: 'LUG ',
              style: TextStyle(color: Colors.purpleAccent),
            ),
            TextSpan(text: 'Users regain control'),
          ],
        ),
      ),
      imagePath: 'assets/icons8-hourglass-100.png',
      heading: '3 Hours',
      subtext: 'of screen time each day',
    ),
    OnboardingPage(
      title: const Text(
        'The only SMART app blocker',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      imagePath: 'assets/icons8-thumbs-up-100.png',
      heading: '',
      subtext: 'powered by AI chat support',
    ),
    OnboardingPage(
      title: const Text(
        'Pause and reflect',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      imagePath: 'assets/icons8-down-100.png',
      heading: '',
      subtext: 'before diving into distracting apps',
    ),
    OnboardingPage(
      title: const Text(
        'Split up your screentime',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      imagePath: 'assets/icons8-clock-100.png',
      heading: '',
      subtext: 'into focused, mindful sessions',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignInPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062A40),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: _pages,
                  ),
                  Positioned(
                    top: 16,
                    right: 24,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const SignInPage()),
                        );
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.purpleAccent,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => _buildDot(index == _currentPage),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text(
                  _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: 12,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.purple : Colors.grey.shade700,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final Widget title;
  final String imagePath;
  final String heading;
  final String subtext;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.heading,
    required this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 60),
          title,
          const SizedBox(height: 24),
          Center(child: Image.asset(imagePath, height: 120)),
          const SizedBox(height: 24),
          if (heading.isNotEmpty)
            Text(
              heading,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
          const SizedBox(height: 8),
          Text(
            subtext,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062A40),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF1E4256),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(text: 'Sign-In to UN'),
                    TextSpan(
                      text: 'PLUG',
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: Image.asset('assets/icons8-google-28.png', height: 24),
                label: const Text(
                  'Sign-In with Google',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white),
              const Text('Or', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  filled: true,
                  fillColor: Colors.grey.shade500,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  filled: true,
                  fillColor: Colors.grey.shade500,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SubscriptionPlansPage(),
                    ),
                  );
                },
                child: const Text(
                  'Join Us',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionPlansPage extends StatelessWidget {
  const SubscriptionPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062A40),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            const Text(
              'Unlock Lifetime Access',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Hey! unlock lifetime access  and say goodbye to\n distractions forever.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13.5,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),

            // Plan options
            _buildPlanOption(
              context,
              title: 'Weekly Pass',
              price: '\$ 10.29',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PlanDetailPage(
                      planName: 'Weekly Pass',
                      validity: '7 Days',
                      price: '\$ 10.29',
                      description: 'Perfect for trial use',
                    ),
                  ),
                );
              },
            ),
            _buildPlanOption(
              context,
              title: 'Monthly Plan',
              price: '\$ 41.16',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MonthlyPlanDetailPage(),
                  ),
                );
              },
            ),
            _buildPlanOption(
              context,
              title: 'Yearly Plan',
              price: '\$ 493.92',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const YearlyPlanDetailPage(),
                  ),
                );
              },
            ),

            const Spacer(),

            const Text(
              'Thank you',
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            const Text(
              'For choosing our plans!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Skip button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ScreenTimePermissionPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9B5FB5),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanOption(
    BuildContext context, {
    required String title,
    required String price,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7B588B),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              price,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenTimePermissionPage extends StatelessWidget {
  const ScreenTimePermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062A40),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            const Text(
              "First, allow Screentime",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            const Text(
              "To limit your distracting apps, Unplug\nrequires your permission to reduce distractions",
              style: TextStyle(fontSize: 14, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Permission Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2F3E50),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    "Unplug Would like to Access\nScreen Time",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Providing Unplug access to Screen\nTime may allow it to see your\nactivity data, restrict content, and\nlimit the usage of apps",
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      // Continue Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const SelectDistractionAppsPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text("Continue"),
                        ),
                      ),

                      // Don't Allow Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle don't allow logic if needed
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text("Don't Allow"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            Column(
              children: const [
                Text(
                  "Your Data is protected by Android",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                SizedBox(height: 8),
                Text(
                  "Learn More",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlanDetailPage extends StatelessWidget {
  final String planName;
  final String validity;
  final String price;
  final String description;

  const PlanDetailPage({
    super.key,
    required this.planName,
    required this.validity,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062A40),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  planName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Plan Detail Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF103144),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Row with Description + Validity/Price
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left Side: Description
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Unlimited usage for 7 days",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                description,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),

                        // Right Side: Validity and Price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Validity",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              validity,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "Price",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "\$$price",
                              style: const TextStyle(
                                color: Colors.purpleAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const Divider(color: Colors.white24),

                    const SizedBox(height: 12),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment Options",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Payment Logos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentFormPage(),
                              ),
                            );
                          },
                          child: Image.asset('assets/visa.png', height: 40),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentFormPage(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/mastercard.png',
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Click, Select card, and Pay",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),

              const Spacer(),
              const Center(
                child: Text(
                  "Note: all payments are secure and encrypted",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purpleAccent, fontSize: 12),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class MonthlyPlanDetailPage extends StatelessWidget {
  const MonthlyPlanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062A40),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Monthly Plan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Plan Box
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E4256),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left Column: Description
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Unlimited usage for 30 days",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Great for ongoing use and flexibility",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),

                        // Right Column: Validity and Price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              "Validity",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "30 Days",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 14),
                            Text(
                              "Price",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "\$41.16",
                              style: TextStyle(
                                color: Colors.purpleAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    const Divider(color: Colors.white30),
                    const SizedBox(height: 16),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment Options",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Payment Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentFormPage(),
                              ),
                            );
                          },
                          child: Image.asset('assets/visa.png', height: 40),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentFormPage(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/mastercard.png',
                            height: 40,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      "Click, Select card, and Pay",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              const Spacer(),
              const Center(
                child: Text(
                  "Note: all payments are\nsecure and encrypted",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purpleAccent, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YearlyPlanDetailPage extends StatelessWidget {
  const YearlyPlanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062A40),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Yearly Plan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Plan Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF103144),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Plan Info Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left Column: Description
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Unlimited usage for 365 days",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Worry free access for the whole year",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),

                        // Right Column: Validity & Price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              "Validity",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "365 Days",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 14),
                            Text(
                              "Price",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "\$493.92",
                              style: TextStyle(
                                color: Colors.purpleAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    const Divider(color: Colors.white30),
                    const SizedBox(height: 16),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment Options",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Payment Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentFormPage(),
                              ),
                            );
                          },
                          child: Image.asset('assets/visa.png', height: 40),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentFormPage(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/mastercard.png',
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Click, Select card, and Pay",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),

              const Spacer(),
              const Center(
                child: Text(
                  "Note: all payments are\nsecure and encrypted",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purpleAccent, fontSize: 12),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentFormPage extends StatelessWidget {
  const PaymentFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062A40),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF102D3D),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Payment Method',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Card Holder Name
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Card Holder’s Name",
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purpleAccent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purpleAccent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Card Number
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Card Number",
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purpleAccent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purpleAccent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),

                  // Expiration and CVV
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Expiration Date",
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.purpleAccent,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.purpleAccent,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "CVV",
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.purpleAccent,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.purpleAccent,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Confirm Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ScreenTimePermissionPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    "Note: all payments are\nsecure and encrypted",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.purpleAccent, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectDistractionAppsPage extends StatefulWidget {
  const SelectDistractionAppsPage({super.key});

  @override
  State<SelectDistractionAppsPage> createState() =>
      _SelectDistractionAppsPageState();
}

class _SelectDistractionAppsPageState extends State<SelectDistractionAppsPage> {
  final List<String> categories = [
    'Social',
    'Games',
    'Entertainment',
    'Creativity',
  ];
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Please Select Apps",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
                                    Image.asset(
                                      categoryIcons[category]!,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      category,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      expanded[category]!
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
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
                                        Text(
                                          app,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
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
                        MaterialPageRoute(
                          builder: (_) => const SelectTimePage(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "Select Apps",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
    "Creativity": ["Pinterest", "Canva", "Notion"],
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

  bool get anyAppSelected => selectedApps.values.any((apps) => apps.isNotEmpty);

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
              Text(
                category,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
          ...apps.map(
            (app) => ListTile(
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
            ),
          ),
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
                children: categories.keys
                    .map((c) => buildCategoryTile(c))
                    .toList(),
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

class SelectTimePage extends StatelessWidget {
  const SelectTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F24),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            const SizedBox(height: 40),

            /// Title
            const Text(
              "When to reduce app screentime?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 40),

            /// Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  buildOptionButton(context, "All The Time"),
                  buildOptionButton(context, "Work Days"),
                  buildOptionButton(context, "Week Nights"),
                  buildOptionButton(context, "Mornings"),
                  buildOptionButton(context, "Specific Time Range"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: OutlinedButton(
        onPressed: () {
          if (label == "All The Time") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AllTheTimePage()),
            );
          } else if (label == "Work Days") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SpecificTimePage()),
            );
          } else if (label == "Week Nights") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WeekNightsPage()),
            );
          } else if (label == "Mornings") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MorningsPage()),
            );
          } else if (label == "Specific Time Range") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SpecificTimeePage()),
            );
          } else {
            print("Selected: $label");
          }
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.purple, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class SpecificTimePage extends StatefulWidget {
  const SpecificTimePage({super.key});

  @override
  State<SpecificTimePage> createState() => _SpecificTimePageState();
}

class _SpecificTimePageState extends State<SpecificTimePage> {
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
                      const Text(
                        "Start Time:",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => _selectTime(context, true),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          formatTime(_startTime),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "End Time:",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => _selectTime(context, false),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          formatTime(_endTime),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// Days of Week
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _days.length,
                      (i) => buildDayChip(i),
                    ),
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
                      builder: (context) => const DailyLimitPage(),
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
                      const Text(
                        "Start Time:",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => _selectTime(context, true),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          formatTime(_startTime),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "End Time:",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => _selectTime(context, false),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          formatTime(_endTime),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// Days of Week
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _days.length,
                      (i) => buildDayChip(i),
                    ),
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
                    MaterialPageRoute(builder: (_) => const DailyLimitPage()),
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

class AllTheTimePage extends StatelessWidget {
  const AllTheTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F24),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const SizedBox(height: 40),

            /// Title
            const Text(
              "When to reduce app screentime?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            /// Selected Button (All The Time)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: OutlinedButton(
                onPressed: () {
                  // Already selected
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.purple, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "All The Time",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Spacer(),

            /// Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: ElevatedButton(
                onPressed: () {
                  // ✅ Navigate to DailyLimitPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DailyLimitPage()),
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

class SpecificTimeePage extends StatefulWidget {
  const SpecificTimeePage({super.key});

  @override
  State<SpecificTimeePage> createState() => _SpecificTimeePageState();
}

class _SpecificTimeePageState extends State<SpecificTimeePage> {
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
                  /// Start Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Start Time:",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => _selectTime(context, true),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          formatTime(_startTime),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// End Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "End Time:",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => _selectTime(context, false),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          formatTime(_endTime),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// Days of Week
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _days.length,
                      (i) => buildDayChip(i),
                    ),
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
                    MaterialPageRoute(builder: (_) => const DailyLimitPage()),
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

class MorningsPage extends StatefulWidget {
  const MorningsPage({super.key});

  @override
  State<MorningsPage> createState() => _MorningsPageState();
}

class _MorningsPageState extends State<MorningsPage> {
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
            const SizedBox(height: 20),

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
                      const Text(
                        "Start Time:",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => _selectTime(context, true),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          formatTime(_startTime),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "End Time:",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => _selectTime(context, false),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.purple.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          formatTime(_endTime),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// Days of Week
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _days.length,
                      (i) => buildDayChip(i),
                    ),
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
                  // Debug log (optional)
                  print("Start: ${formatTime(_startTime)}");
                  print("End: ${formatTime(_endTime)}");
                  print("Days: $_selectedDays");

                  // ✅ Navigate to DailyLimitPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DailyLimitPage()),
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
            alignment: isWeekSelected
                ? Alignment.centerLeft
                : Alignment.centerRight,
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
          const Text(
            "Screen Time",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            "This Week",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const Text(
            "14h 42m",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(builder: (_, __) => _buildBarsSection()),
          const SizedBox(height: 16),
          const Text(
            "Total screen time",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const Text(
            "22h 30m",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Updated today at 2:51 PM",
            style: TextStyle(color: Colors.white38, fontSize: 10),
          ),
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
          const Text(
            "Screen Time",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            "Today, 12 July",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const Text(
            "2h 11m",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(builder: (_, __) => _buildBarsSection()),
          const SizedBox(height: 16),
          const Text(
            "Total screen time",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const Text(
            "5h 20m",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Updated today at 2:51 PM",
            style: TextStyle(color: Colors.white38, fontSize: 10),
          ),
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
          const Text(
            "Most Used",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildAppUsageRow(
            "Instagram",
            isWeekSelected ? "25h" : "5h",
            'assets/icons8-instagram-28.png',
          ),
          const SizedBox(height: 12),
          _buildAppUsageRow(
            "Facebook",
            isWeekSelected ? "40m" : "14m",
            'assets/icons8-facebook-28.png',
          ),
          const SizedBox(height: 12),
          _buildAppUsageRow(
            "WhatsApp",
            isWeekSelected ? "19h" : "1h",
            'assets/icons8-whatsapp-28.png',
          ),
        ],
      ),
    );
  }

  Widget _buildAppUsageRow(String name, String time, String iconPath) {
    return Row(
      children: [
        Image.asset(iconPath, height: 24, width: 24),
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
          icon: Image.asset('assets/icons8-chat-28.png', height: 24, width: 24),
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
        Text(
          label,
          style: const TextStyle(color: Colors.white60, fontSize: 10),
        ),
      ],
    );
  }
}

class ThirtyMinPage extends StatefulWidget {
  const ThirtyMinPage({super.key});

  @override
  State<ThirtyMinPage> createState() => _ThirtyMinPageState();
}

class _ThirtyMinPageState extends State<ThirtyMinPage> {
  final List<String> timeOptions = [
    '1 minute',
    '2 minutes',
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '30 minutes',
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
              title: Text(option, style: const TextStyle(color: Colors.white)),
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

              LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey.shade800,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
              ),

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
                  '30 Minutes',
                  style: TextStyle(color: Colors.white, fontSize: 16),
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
    '30 minutes',
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
              title: Text(option, style: const TextStyle(color: Colors.white)),
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
                  style: TextStyle(color: Colors.white, fontSize: 16),
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

class TwoHoursPage extends StatefulWidget {
  const TwoHoursPage({super.key});

  @override
  State<TwoHoursPage> createState() => _TwoHoursPageState();
}

class _TwoHoursPageState extends State<TwoHoursPage> {
  final List<String> timeOptions = [
    '1 minute',
    '2 minutes',
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '30 minutes',
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
              title: Text(option, style: const TextStyle(color: Colors.white)),
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
                  '2 Hours',
                  style: TextStyle(color: Colors.white, fontSize: 16),
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

class OneHoursPage extends StatefulWidget {
  const OneHoursPage({super.key});

  @override
  State<OneHoursPage> createState() => _OneHoursPageState();
}

class _OneHoursPageState extends State<OneHoursPage> {
  final List<String> timeOptions = [
    '1 minute',
    '2 minutes',
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '30 minutes',
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
              title: Text(option, style: const TextStyle(color: Colors.white)),
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

              // Title
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

              // Subtext
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

              // Fixed limit
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
                  '1 Hours',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Use each app for',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const SizedBox(height: 10),

              // Dropdown Button
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

              // Continue Button
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
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 14),
                          ),
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
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 14),
                          ),
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

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C2D),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            const SizedBox(height: 100),

            // Card with question and buttons
            Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F3A4A),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Do you like the approach so far?",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // YES Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForSelectGoalPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF9B59B6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // NO Button
                        OutlinedButton(
                          onPressed: () {
                            // You can handle "No" action here
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF9B59B6)),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForSelectGoalPage extends StatelessWidget {
  const ForSelectGoalPage({Key? key}) : super(key: key);

  void onGoalSelected(BuildContext context, String days) {
    // Navigate to AdjustGoal screen with selected days
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommitGoalScreen(goalTitle: days),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> goals = ['30 days', '14 days', '7 days', '3 days'];

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C2D),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const SizedBox(height: 40),
            const Text(
              'Pick a streak goal to build\na lasting habit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ...goals.map(
              (goal) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 8.0,
                ),
                child: OutlinedButton(
                  onPressed: () => onGoalSelected(context, goal),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF9B59B6), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      goal,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: 'plug\n',
                                style: TextStyle(color: Color(0xFF9B59B6)),
                              ),
                              TextSpan(
                                text: 'Ambreen',
                                style: TextStyle(color: Color(0xFFE84393)),
                              ),
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
                          suffixIcon: const Icon(
                            Icons.send,
                            color: Colors.cyanAccent,
                          ),
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

class AllDonePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A), // Dark background
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "You Completed The Setup",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Image.asset('assets/icons8-party-100.png', height: 120),
                const SizedBox(height: 24),
                const Text(
                  "Now switch out of Unplug and open your distracting app to try it out",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAA4FFF),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 16),
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

class CommitGoalScreen extends StatelessWidget {
  final String goalTitle;

  const CommitGoalScreen({Key? key, required this.goalTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C2D),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),

            Text(
              "Finally, commit to your goal\n($goalTitle)",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C3A47),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  GoalItem(
                    icon: Icons.check_circle,
                    title: "30 mins daily limit",
                    subtitle:
                        "5 minutes sessions, 6 times daily Applies on sun, mon, tue, wed, fri, sat 12:00 AM -- 11:59 PM",
                    image: AssetImage("assets/icons8-instagram-28.png"),
                  ),
                  SizedBox(height: 16),
                  GoalItem(
                    icon: Icons.check_circle,
                    title: "5 seconds mindful pause",
                  ),
                ],
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdjustGoalTwo()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Color(0xFFB54AFF), width: 2),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Adjust Goal",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoalItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final ImageProvider? image;

  const GoalItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: subtitle != null
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Icon(icon, color: const Color(0xFF4AA9FF)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  if (image != null) ...[
                    const SizedBox(width: 8),
                    Image(image: image!, width: 20, height: 20),
                  ],
                ],
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class MainScreen extends StatelessWidget {
  final List<GroupCardData> groups = [
    GroupCardData(name: "Group 1", days: "Su, M, T, W, T, F, Sa"),
    GroupCardData(name: "Group 2", days: "Su, T, T, F, Sa"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      body: SafeArea(
        child: Column(
          children: [
            // ✅ GestureDetector wrapped around visible content
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AIChatLayout()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    "💡 Unlock Lifetime Access 💡",
                    style: TextStyle(
                      color: Color(0xFFAA4FFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),

            // ✅ Group List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  return GroupCard(data: groups[index]);
                },
              ),
            ),
          ],
        ),
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D1B2A),
        selectedItemColor: const Color(0xFFAA4FFF),
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const AIChatLayout()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const WeeklyScreenTime()),
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
            icon: Image.asset('assets/icons8-shield-28.png', height: 24),
            label: "Apps",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-chat-28.png', height: 24),
            label: "UnplugAI",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-last-24-hours-28.png', height: 24),
            label: "Screen Time",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons8-contact-info-28.png', height: 24),
            label: "More",
          ),
        ],
      ),
    );
  }
}

class GroupCardData {
  final String name;
  final String days;
  final List<String> icons;

  GroupCardData({
    required this.name,
    required this.days,
    this.icons = const ["facebook", "instagram", "whatsapp"],
  });
}

class GroupCard extends StatelessWidget {
  final GroupCardData data;

  const GroupCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1B263B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name & Days Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.days,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Icons Row
            Row(
              children: data.icons.map((icon) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Image.asset(
                    'assets/icons8-instagram-28.png',
                    width: 24,
                    height: 24,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),

            // Streak
            const Text(
              "Streak day 1",
              style: TextStyle(
                color: Color(0xFFAA4FFF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
            alignment: isWeekSelected
                ? Alignment.centerLeft
                : Alignment.centerRight,
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
          const Text(
            "Screen Time (Weekly)",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            "Week: 6 - 12 July",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 20),
          _buildWeeklyBarsSection(),
          const SizedBox(height: 16),
          const Text(
            "Total screen time",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const Text(
            "18h 45m",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Updated today at 2:51 PM",
            style: TextStyle(color: Colors.white38, fontSize: 10),
          ),
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
          const Text(
            "Screen Time (Daily)",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          const Text(
            "Today, 12 July",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 10),
          const Text(
            "2h 11m",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildDailyBarsSection(),
          const SizedBox(height: 8),
          const Text(
            "Updated today at 2:51 PM",
            style: TextStyle(color: Colors.white38, fontSize: 10),
          ),
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
    String label,
    double height,
    String time,
    Color color,
  ) {
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
          const Text(
            "Most Used",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildAppUsageRow(
            "Instagram",
            isWeekSelected ? "25h" : "5h",
            'assets/icons8-instagram-28.png',
          ),
          const SizedBox(height: 12),
          _buildAppUsageRow(
            "Facebook",
            isWeekSelected ? "40m" : "14m",
            'assets/icons8-facebook-28.png',
          ),
          const SizedBox(height: 12),
          _buildAppUsageRow(
            "WhatsApp",
            isWeekSelected ? "19h" : "1h",
            'assets/icons8-whatsapp-28.png',
          ),
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
          icon: Image.asset('assets/icons8-chat-28.png', height: 24, width: 24),
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
                  Text(
                    "No Data saved",
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Unplug ⓒ All rights reserved",
                    style: TextStyle(color: Colors.white60, fontSize: 12),
                  ),
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
          icon: Image.asset(
            'assets/icons8-shield-28.png',
            height: 24,
            width: 24,
          ),
          label: 'Apps',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/icons8-chat-28.png', height: 24, width: 24),
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
    return const Divider(
      color: Colors.white24,
      thickness: 0.5,
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DailyLimitPage extends StatelessWidget {
  const DailyLimitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F24),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              const SizedBox(height: 30),

              /// Title
              const Text(
                'Daily Limit For Your Distracting App?',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              /// Subtext
              const Text(
                'Tracked between 12:00 AM - 11:59PM',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 40),

              /// Option Buttons
              buildOptionButton(context, '3 Hours'),
              buildOptionButton(context, '2 Hours'),
              buildOptionButton(context, '1 Hour'),
              buildOptionButton(context, '30 Minutes'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOptionButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: OutlinedButton(
        onPressed: () {
          if (label == '3 Hours') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThreeHoursPage()),
            );
          } else if (label == '2 Hours') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TwoHoursPage()),
            );
          } else if (label == '1 Hour') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OneHoursPage()),
            );
          } else if (label == '30 Minutes') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThirtyMinPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Selected: $label'),
                duration: const Duration(seconds: 1),
              ),
            );
          }
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.purple, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
