import 'package:barber/src/core/ui/helpers/images_constants.dart';
import 'package:barber/src/features/auth/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 100 * _scale;
  double get _logoAnimationHeigth => 120 * _scale;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesConstants.backgroundChair),
            opacity: 0.5,
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedOpacity(
          opacity: _animationOpacityLogo,
          curve: Curves.easeIn,
          duration: const Duration(seconds: 5),
          onEnd: () => Navigator.of(context).pushAndRemoveUntil(
              PageRouteBuilder(
                settings: const RouteSettings(name: '/auth/login'),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const LoginPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
              (route) => false),
          child: Center(
            child: AnimatedContainer(
              width: _logoAnimationWidth,
              height: _logoAnimationHeigth,
              curve: Curves.linearToEaseOut,
              duration: const Duration(seconds: 5),
              child: Image.asset(
                ImagesConstants.imgLogo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
