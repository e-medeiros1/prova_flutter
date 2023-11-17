import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  late SharedPreferences _prefs;

  @action
  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @action
  Future userLogin(String username) async {
    _prefs.setString('username', username);
  }

  @action
  Future userLogout() async {
    await _prefs.clear();
  }

  @observable
  bool isLoggedIn = false;

  @action
  Future checkLoginStatus() async {
    String? username = _prefs.getString('username');
    isLoggedIn = username != null;
  }
}
