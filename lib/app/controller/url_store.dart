import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'url_store.g.dart';

class UrlStore = UrlStoreBase with _$UrlStore;

abstract class UrlStoreBase with Store {
  @observable
  var toPrivacyPolicy = Uri(
      scheme: 'https',
      host: 'www.gov.br',
      path: '/mdh/pt-br/acesso-a-informacao/politica-de-privacidade');

  @action
  Future<void> launchInWeb(var url) async {
    if (!await launchUrl(
      Uri.parse(url.toString()),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Não foi possível acessar: $url';
    }
  }
}
