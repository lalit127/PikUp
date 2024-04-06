import 'package:pikup_app/common/common_import.dart';
import 'package:intl/intl.dart';

AppLocalizations? getAppLocalizations(BuildContext context) {
  return AppLocalizations.of(context);
}

Future<AppLocalizations> loadLocalization() async {
  final parts = Intl.getCurrentLocale().split('_');
  final locale = Locale(parts.first, parts.last);
  return await AppLocalizations.delegate.load(locale);
}
