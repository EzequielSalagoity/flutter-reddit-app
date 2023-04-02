import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:yaml/yaml.dart';

class AppLocalizations {
  final String localeName;

  AppLocalizations(this.localeName);

  static const LocalizationsDelegate<AppLocalizations> delegate =  _AppLocalizationsDelegate();

  late YamlMap? translations;

  Future load() async {
    String yamlString = await rootBundle.loadString('lang/$localeName.yml');
    translations = loadYaml(yamlString);
  }

  dynamic t(String key) {
    try {
      final keys = key.split(".");
      dynamic translated = translations;
      if (translated == null) return "Key not found: $key";

      for (var k in keys) {
        translated = translated[k];
      }

      if (translated == null) return "Key not found: $key";

      return translated;
    } catch (e) {
      return "Key not found: $key";
    }
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final t = AppLocalizations(locale.languageCode);
    await t.load();
    return t;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
