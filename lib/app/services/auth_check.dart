import 'package:flutter/material.dart';

import '../controller/auth_store.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStore = AuthStore();
    return FutureBuilder<bool>(
      future: authStore.isLogged(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data!) {
            return const HomePage();
          }
          return const LoginPage();
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF44bd6e),
          ),
        );
      },
    );
  }
}
