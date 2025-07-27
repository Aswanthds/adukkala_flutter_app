import 'dart:async';

import 'package:adukkala_app/controller/dishes_provider.dart';
import 'package:adukkala_app/view/apptheme.dart';
import 'package:adukkala_app/view/cooking_timer.dart';
import 'package:adukkala_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DishesProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,

        home: const SplashPage(),
        routes: {
          '/recipeDetail': (context) => CookingStepsScreen(
            steps: sampleCookingSteps,
          ), // You must define this
        },
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _goToNextScreen();
  }

  void _goToNextScreen() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(), // Replace with your target page
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Or any custom theme color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your logo here
            Image.asset(
              'assets/log_.png', // Make sure the logo exists in your assets
              // width: 120,
              // height: 120,
            ),
            const SizedBox(height: 20),
            Text(
              'Addukkala',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown.shade700,
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
