import 'package:flutter/material.dart';
import 'package:prova_flutter/app/controller/auth_store.dart';

import 'app/prova_flutter.dart';

void main() async {
  final authStore = AuthStore();
  WidgetsFlutterBinding.ensureInitialized();
  await authStore.init();
  runApp(const ProvaFlutter());
}
