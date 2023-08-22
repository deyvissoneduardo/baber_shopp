import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:barber/src/features/core/ui/widgets/babershop_loader.dart';
import 'package:barber/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BabershopLoader(),
      builder: (asyncNavigatorObserver) => MaterialApp(
        title: 'Barber Shopp',
        navigatorObservers: [asyncNavigatorObserver],
        routes: {
          '/': (_) => const SplashPage(),
        },
      ),
    );
  }
}
