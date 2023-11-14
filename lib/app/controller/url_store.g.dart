// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UrlStore on UrlStoreBase, Store {
  late final _$toPrivacyPolicyAtom =
      Atom(name: 'UrlStoreBase.toPrivacyPolicy', context: context);

  @override
  Uri get toPrivacyPolicy {
    _$toPrivacyPolicyAtom.reportRead();
    return super.toPrivacyPolicy;
  }

  @override
  set toPrivacyPolicy(Uri value) {
    _$toPrivacyPolicyAtom.reportWrite(value, super.toPrivacyPolicy, () {
      super.toPrivacyPolicy = value;
    });
  }

  late final _$launchInWebAsyncAction =
      AsyncAction('UrlStoreBase.launchInWeb', context: context);

  @override
  Future<void> launchInWeb(dynamic url) {
    return _$launchInWebAsyncAction.run(() => super.launchInWeb(url));
  }

  @override
  String toString() {
    return '''
toPrivacyPolicy: ${toPrivacyPolicy}
    ''';
  }
}
