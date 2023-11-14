import 'package:flutter/material.dart';
import 'package:prova_flutter/app/pages/login/components/custom_button.dart';
import 'package:prova_flutter/app/pages/login/components/custom_field.dart';
import 'package:validatorless/validatorless.dart';

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
  final RegExp _myRegex = RegExp(r'^[a-zA-Z]+$');

  @override
  void dispose() {
    _userController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                  child: Text('Usuário'),
                ),
                CustomField(
                  controller: _userController,
                  icon: const Icon(Icons.person),
                  validator: Validatorless.multiple([
                    Validatorless.required('O campo usuário é obrigatório'),
                    Validatorless.max(20,
                        'O nome de usuário deve ter no máximo 20 caracteres'),
                  ]),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text('Senha'),
                ),
                CustomField(
                  controller: _senhaController,
                  icon: const Icon(Icons.lock),
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
                CustomButton(onPressed: () {}, child: const Text('Entrar')),
                const Spacer(),
                InkWell(
                    onTap: () {},
                    child:
                        const Center(child: Text('Política de Privacidade'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
