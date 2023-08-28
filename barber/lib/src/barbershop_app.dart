import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:barber/src/features/auth/login/login_page.dart';
import 'package:barber/src/core/ui/widgets/babershop_loader.dart';
import 'package:barber/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/ui/theme/babershop_theme.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BabershopLoader(),
      builder: (asyncNavigatorObserver) => MaterialApp(
        title: 'Barber Shopp',
        theme: BabershopTheme.themeData,
        navigatorObservers: [asyncNavigatorObserver],
        routes: {
          '/': (_) => const SplashPage(),
          '/auth/login': (_) => const LoginPage(),
          '/home/adm': (_) => const LoginPage(),
          '/home/employee': (_) => const LoginPage(),
        },
      ),
    );
  }
}
