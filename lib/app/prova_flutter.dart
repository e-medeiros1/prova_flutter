import 'package:flutter/material.dart';

import 'core/routes/named_routes.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';

class ProvaFlutter extends StatelessWidget {
  const ProvaFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NamedRoutes.LOGIN_PAGE,
      routes: {
        NamedRoutes.LOGIN_PAGE: (_) => const LoginPage(),
        NamedRoutes.CHAT_PAGE: (_) => const HomePage(),
      },
    );
  }
}
