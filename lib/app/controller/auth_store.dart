import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  @observable
  late SharedPreferences _prefs;

  @action
  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @action
  Future userLogin(String username) async {
    try {
      _prefs.setString('username', username);
    } catch (e) {
      log('Login has failed', error: e);
      throw Exception('Login has failed');
    }
  }

  @action
  userLogout() {
    try {
      _prefs.clear();
    } catch (e) {
      log('Logout has failed', error: e);
      throw Exception('Logout has failed');
    }
  }

  Future<bool> isLogged() async {
    String? username = _prefs.getString('username');
    if (username == null) return false;
    return true;
  }

  // updateUsername(String updatedUsername) {
  //   _prefs.setString('username', updatedUsername);
  // }
}
