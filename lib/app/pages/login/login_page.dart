// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:prova_flutter/app/controller/auth_store.dart';
import 'package:prova_flutter/app/controller/url_store.dart';
import 'package:prova_flutter/app/pages/login/components/custom_button.dart';
import 'package:prova_flutter/app/pages/login/components/custom_field.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/routes/named_routes.dart';
import '../../core/widgets/privacy_policy_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final RegExp _myRegex = RegExp(r'^[a-zA-Z0-9]*$');
  final _urlStore = UrlStore();
  final _authStore = AuthStore();

  @override
  void dispose() {
    _userController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future _initApp() async {
    await _authStore.init();
  }

  @override
  void initState() {
    _initApp();
    super.initState();
  }

  Future _login() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      await _authStore.userLogin(_userController.text.trimRight());

      Navigator.pushReplacementNamed(context, NamedRoutes.HOME_PAGE,
          arguments: _userController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1b4e62), Color(0xFF2b8d89)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Usuário',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  CustomField(
                    controller: _userController,
                    icon: Icons.person,
                    validator: Validatorless.multiple([
                      Validatorless.required('O campo usuário é obrigatório'),
                      Validatorless.max(20,
                          'O nome de usuário deve ter no máximo 20 caracteres'),
                    ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Senha',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  CustomField(
                    obscureText: true,
                    controller: _senhaController,
                    icon: Icons.lock,
                    validator: Validatorless.multiple([
                      Validatorless.required('O campo senha é obrigatório'),
                      Validatorless.min(
                          2, 'A senha deve ter no mínimo 2 caracteres'),
                      Validatorless.regex(_myRegex,
                          'A senha deve conter apenas caracteres de a-z e 0-9'),
                      Validatorless.max(
                          20, 'A senha deve ter no máximo 20 caracteres'),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    onPressed: () async {
                      return _login();
                    },
                    text: 'Entrar',
                  ),
                  const Spacer(),
                  PrivacyPolicyWidget(
                      onPressed: () =>
                          _urlStore.launchInWeb(_urlStore.toPrivacyPolicy)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
