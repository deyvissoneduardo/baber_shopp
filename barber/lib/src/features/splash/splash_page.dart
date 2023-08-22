import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image_chair.jpg'),
            opacity: 0.5,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/imgLogo.png'),
        ),
      ),
    );
  }
}
