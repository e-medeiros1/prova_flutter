// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/app/controller/auth_store.dart';
import 'package:prova_flutter/app/controller/card_store.dart';
import 'package:prova_flutter/app/controller/url_store.dart';

import '../../core/routes/named_routes.dart';
import '../../core/widgets/privacy_policy_widget.dart';
import 'components/custom_card.dart';
import 'components/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _urlStore = UrlStore();
  final _cardStore = CardStore();
  final _textController = TextEditingController();
  final _authStore = AuthStore();

  @override
  void initState() {
    _cardStore.init();
    _authStore.init();
    super.initState();
  }

  Future _logout() async {
    await _authStore.userLogout();

    Navigator.popAndPushNamed(context, NamedRoutes.LOGIN_PAGE);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            TextButton.icon(
              onPressed: () => _logout(),
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              label: const Text(
                'Sair',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1b4e62), Color(0xFF2b8d89)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Observer(builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: size.width * .9,
                              height: size.height * .4,
                              child: ListView.builder(
                                  itemCount: _cardStore.cardList.length,
                                  itemBuilder: (context, index) {
                                    return CustomCard(
                                      cardModel: _cardStore.cardList[index],
                                      text: _cardStore
                                          .cardList[index].description,
                                      onPressedDelete: () {
                                        setState(() {
                                          if (_cardStore.cardList.isNotEmpty) {
                                            _cardStore.removeCard(
                                                _cardStore.cardList[index]);
                                          } else {
                                            return;
                                          }
                                        });
                                      },
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    size: size,
                    textController: _textController,
                    cardStore: _cardStore,
                  ),
                  const Spacer(),
                  PrivacyPolicyWidget(
                      onPressed: () =>
                          _urlStore.launchInWeb(_urlStore.toPrivacyPolicy)),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
