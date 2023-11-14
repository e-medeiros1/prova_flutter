// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthStoreBase, Store {
  late final _$_prefsAtom =
      Atom(name: 'AuthStoreBase._prefs', context: context);

  @override
  SharedPreferences get _prefs {
    _$_prefsAtom.reportRead();
    return super._prefs;
  }

  @override
  set _prefs(SharedPreferences value) {
    _$_prefsAtom.reportWrite(value, super._prefs, () {
      super._prefs = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('AuthStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$userLoginAsyncAction =
      AsyncAction('AuthStoreBase.userLogin', context: context);

  @override
  Future<dynamic> userLogin(String username) {
    return _$userLoginAsyncAction.run(() => super.userLogin(username));
  }

  late final _$AuthStoreBaseActionController =
      ActionController(name: 'AuthStoreBase', context: context);

  @override
  dynamic userLogout() {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.userLogout');
    try {
      return super.userLogout();
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
