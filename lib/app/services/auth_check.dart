import 'package:flutter/material.dart';

import '../controller/auth_store.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';

class AuthCheck extends StatelessWidget {
  final AuthStore authStore;

  const AuthCheck({Key? key, required this.authStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: authStore.init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder<void>(
            future: authStore.checkLoginStatus(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (authStore.isLoggedIn) {
                  return const HomePage();
                }
                return const LoginPage();
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF44bd6e),
                  ),
                );
              }
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF44bd6e),
            ),
          );
        }
      },
    );
  }
}
