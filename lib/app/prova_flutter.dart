import 'package:flutter/material.dart';
import 'package:prova_flutter/app/controller/auth_store.dart';
import 'package:prova_flutter/app/services/auth_check.dart';

import 'core/routes/named_routes.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';

class ProvaFlutter extends StatelessWidget {
  const ProvaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    final authStore = AuthStore();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NamedRoutes.AUTH_CHECK,
      routes: {
        NamedRoutes.AUTH_CHECK: (_) => AuthCheck(authStore: authStore),
        NamedRoutes.LOGIN_PAGE: (_) => const LoginPage(),
        NamedRoutes.HOME_PAGE: (_) => const HomePage(),
      },
    );
  }
}
