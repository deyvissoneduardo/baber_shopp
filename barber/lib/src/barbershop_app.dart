import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:barber/src/core/ui/helpers/babershop_nav_gloval_key.dart';
import 'package:barber/src/features/auth/login/login_page.dart';
import 'package:barber/src/core/ui/widgets/babershop_loader.dart';
import 'package:barber/src/features/auth/register/barbershop/barbershop_register_page.dart';
import 'package:barber/src/features/home/adm/home_adm_page.dart';
import 'package:barber/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/ui/theme/babershop_theme.dart';
import 'features/auth/register/user/user_register_page.dart';

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
        navigatorKey: BarbershopNavGlobalKey.instance.navKey,
        routes: {
          '/': (_) => const SplashPage(),
          '/auth/login': (_) => const LoginPage(),
          '/auth/register/user': (_) => const UserRegisterPage(),
          '/auth/register/babershop': (_) => const BarbershopRegisterPage(),
          '/home/adm': (_) => const HomeAdmPage(),
          '/home/employee': (_) => const Text('employee'),
        },
      ),
    );
  }
}
