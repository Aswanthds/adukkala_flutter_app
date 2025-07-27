import 'package:flutter/material.dart';

// Dummy CookingStep class for context
class CookingStep {
  final String title;
  final String description;
  final String? imageUrl;
  final bool hasTimer;
  final int timerSeconds;

  CookingStep({
    required this.title,
    required this.description,
    this.imageUrl,
    this.hasTimer = false,
    this.timerSeconds = 0,
  });
}
final List<CookingStep> sampleCookingSteps = [
  CookingStep(
    title: "Preparation",
    description:
        "Wash and cut all vegetables. Gather all ingredients on your kitchen counter.",
    imageUrl: "https://example.com/images/step1.jpg",
  ),
  CookingStep(
    title: "Sautéing Onions",
    description:
        "Heat oil in a pan and sauté the chopped onions until golden brown.",
    imageUrl: "https://example.com/images/step2.jpg",
    hasTimer: true,
    timerSeconds: 120, // 2 minutes
  ),
  CookingStep(
    title: "Add Spices",
    description:
        "Add ginger-garlic paste, turmeric, chili powder, and garam masala. Cook for a few minutes.",
    imageUrl: "https://example.com/images/step3.jpg",
    hasTimer: true,
    timerSeconds: 60,
  ),
  CookingStep(
    title: "Add Tomatoes",
    description:
        "Add chopped tomatoes and cook until they soften and oil separates.",
    imageUrl: "https://example.com/images/step4.jpg",
    hasTimer: true,
    timerSeconds: 180, // 3 minutes
  ),
  CookingStep(
    title: "Add Main Ingredient",
    description:
        "Add your main ingredient (e.g., chicken, paneer) and stir well.",
    imageUrl: "https://example.com/images/step5.jpg",
  ),
  CookingStep(
    title: "Simmer",
    description: "Add water or cream, cover the lid, and simmer on low heat.",
    imageUrl: "https://example.com/images/step6.jpg",
    hasTimer: true,
    timerSeconds: 600, // 10 minutes
  ),
  CookingStep(
    title: "Garnish and Serve",
    description: "Garnish with coriander leaves. Serve hot with rice or roti.",
    imageUrl: "https://example.com/images/step7.jpg",
  ),
];

// Dummy CookingTimer widget for steps with timers
class CookingTimer extends StatelessWidget {
  final int initialSeconds;

  const CookingTimer({super.key, required this.initialSeconds});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Timer: $initialSeconds seconds',
        style: const TextStyle(fontSize: 18, color: Colors.red),
      ),
    );
  }
}

// Main Cooking Steps Screen
class CookingStepsScreen extends StatefulWidget {
  final List<CookingStep> steps;

  const CookingStepsScreen({super.key, required this.steps});

  @override
  State<CookingStepsScreen> createState() => _CookingStepsScreenState();
}

class _CookingStepsScreenState extends State<CookingStepsScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Cooking Mode'),
        backgroundColor: const Color(0xFFFF6B6B),
        actions: [
          IconButton(
            icon: const Icon(Icons.pause),
            onPressed: _showPauseDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          if (widget.steps[_currentStep].hasTimer)
            CookingTimer(
              initialSeconds: widget.steps[_currentStep].timerSeconds,
            ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentStep = index);
              },
              itemCount: widget.steps.length,
              itemBuilder: (context, index) {
                return _buildStepContent(widget.steps[index], index);
              },
            ),
          ),
          _buildNavigationControls(),
          _buildProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildStepContent(CookingStep step, int index) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B6B),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            step.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            step.description,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF333333),
              height: 1.5,
            ),
          ),
          if (step.imageUrl != null)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(step.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavigationControls() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: _currentStep > 0 ? _previousStep : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF8F9FA),
                foregroundColor: const Color(0xFF333333),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text('← Previous'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: _currentStep < widget.steps.length - 1
                  ? _nextStep
                  : _completeRecipe,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B6B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                _currentStep < widget.steps.length - 1
                    ? 'Next →'
                    : 'Complete! 🎉',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentStep + 1) / widget.steps.length,
            backgroundColor: const Color(0xFFE0E8FF),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF6B6B)),
          ),
          const SizedBox(height: 8),
          Text(
            'Step ${_currentStep + 1} of ${widget.steps.length}',
            style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
          ),
        ],
      ),
    );
  }

  void _nextStep() {
    if (_currentStep < widget.steps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _completeRecipe() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🎉 Recipe Complete!'),
        content: const Text('Great job! How did your dish turn out?'),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.popUntil(context, (route) => route.isFirst),
            child: const Text('Back to Home'),
          ),
          ElevatedButton(
            onPressed: _rateRecipe,
            child: const Text('Rate Recipe'),
          ),
        ],
      ),
    );
  }

  void _rateRecipe() {
    Navigator.pop(context); // Close the dialog
    // Add your rating UI logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thank you for your feedback!')),
    );
  }

  void _showPauseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Paused'),
        content: const Text('Cooking paused. Ready to resume?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Resume'),
          ),
        ],
      ),
    );
  }
}
